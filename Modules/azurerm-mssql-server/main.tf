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
  aad_only                     = lookup(var.azuread_administrator, "azuread_authentication_only", "false")

  create_managed_identity_block    = var.identity_type == "SystemAssigned" ? [true] : []
  create_userassign_identity_block = var.identity_type == "UserAssigned" ? [true] : []
}

# -
# - Azure SQL Server
# -
resource "azurerm_mssql_server" "this" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.mssql_version
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version

  administrator_login          = local.aad_only == "false" ? var.administrator_login_name : null
  administrator_login_password = local.aad_only == "false" ? local.administrator_login_password : null

  dynamic "azuread_administrator" {
    for_each = lookup(var.azuread_administrator, "login_username", "") == "" ? [] : [true]
    content {
      login_username              = var.azuread_administrator.login_username
      object_id                   = var.azuread_administrator.object_id
      tenant_id                   = lookup(var.azuread_administrator, "tenant_id", null)
      azuread_authentication_only = lookup(var.azuread_administrator, "azuread_authentication_only", "false")
    }
  }

  # Dynamic block for managed identities
  dynamic "identity" {
    for_each = local.create_managed_identity_block
    content {
      type = var.identity_type
    }
  }

  # Dynamic block for user assigned identities
  dynamic "identity" {
    for_each = local.create_userassign_identity_block
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  lifecycle {
    ignore_changes = [administrator_login_password]
  }

  tags = var.tags
}

# -
# - Add Azure SQL Admin Login Password to Key Vault secrets
# -
resource "azurerm_key_vault_secret" "azuresql_keyvault_secret" {
  count        = var.key_vault_id != null ? 1 : 0
  name         = azurerm_mssql_server.this.name
  value        = local.administrator_login_password
  key_vault_id = var.key_vault_id

  lifecycle {
    # Secrets for db should be managed outside of Terraform
    ignore_changes = [value]
  }

  depends_on = [azurerm_mssql_server.this]
}
