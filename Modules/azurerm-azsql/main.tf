data "azurerm_resource_group" "this" {
  name  = var.resource_group_name
}

data "azurerm_key_vault" "this" {
  count = var.key_vault_name ? 1 : 0
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.this.name
}

# Generate random password
resource "random_password" "this" {
  length           = 32
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  number           = true
  special          = true
  override_special = "!@#$%&"
}

# -
# - Get the current user config
# -
data "azurerm_client_config" "current" {}

locals {
  administrator_login_password = var.administrator_login_password == null ? random_password.this.result : var.administrator_login_password

  zone_redundant = var.sku_name != null ? ((substr(var.sku_name, 0, 2) == "BC" || substr(var.sku_name, 0, 1) == "P") ? true : false) : null

  long_term_retention_policy = var.long_term_retention_policy == {} ? [] : [var.long_term_retention_policy]
  short_term_retention_policy = var.short_term_retention_policy == {} ? [] : [var.short_term_retention_policy]
}

# -
# - Azure SQL Server
# -
resource "azurerm_mssql_server" "this" {
  name                         = var.server_name
  resource_group_name          = data.azurerm_resource_group.this.name
  location                     = data.azurerm_resource_group.this.location
  version                      = var.azuresql_version
  administrator_login          = var.administrator_login_name
  administrator_login_password = local.administrator_login_password

  # - Azure SQL Allow/Deny Public Network Access
  # - Only private endpoint connections will be allowed to access this resource if "private_endpoint_connection_enabled" variable is set to true
  public_network_access_enabled = var.private_endpoint_connection_enabled ? false : true

  minimum_tls_version = var.minimum_tls_version

  dynamic "identity" {
    for_each = var.assign_identity == false ? [] : list(var.assign_identity)
    content {
      type = "SystemAssigned"
    }
  }

  lifecycle {
    ignore_changes = [administrator_login_password]
  }

  tags = var.tags
}

# -
# - Azure SQL Databases
# -
resource "azurerm_mssql_database" "this" {
  count     = length(var.database_names)
  name      = element(var.database_names, count.index)
  server_id = azurerm_mssql_server.this.id

  max_size_gb                 = var.max_size_gb
  sku_name                    = var.sku_name
  zone_redundant              = local.zone_redundant
  elastic_pool_id             = var.elastic_pool_id
  create_mode                 = var.create_mode
  creation_source_database_id = var.creation_source_database_id
  restore_point_in_time       = var.restore_point_in_time

  geo_backup_enabled = var.geo_backup_enabled
  storage_account_type = var.storage_account_type

  tags       = var.tags
  depends_on = [azurerm_mssql_server.this]

  dynamic "long_term_retention_policy" {
    for_each = local.long_term_retention_policy
    content {
      weekly_retention = long_term_retention_policy.weekly_retention
      monthly_retention = long_term_retention_policy.monthly_retention
      yearly_retention = long_term_retention_policy.yearly_retention
      week_of_year = long_term_retention_policy.week_of_year
  }

  dynamic "short_term_retention_policy" {
    for_each = local.short_term_retention_policy
    content {
      weekly_retention = short_term_retention_policy.weekly_retention
      monthly_retention = short_term_retention_policy.monthly_retention
      yearly_retention = short_term_retention_policy.yearly_retention
      week_of_year = short_term_retention_policy.week_of_year
  }
}

# -
# - Add Azure SQL Admin Login Password to Key Vault secrets
# -
resource "azurerm_key_vault_secret" "azuresql_keyvault_secret" {
  count = var.key_vault_name ? 1 : 0
  name         = azurerm_mssql_server.this.name
  value        = local.administrator_login_password
  key_vault_id = data.azurerm_key_vault.this.0.id
  depends_on   = [azurerm_mssql_server.this]
}
