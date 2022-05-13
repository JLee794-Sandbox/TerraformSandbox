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
}

# -
# - Azure SQL Server
# -
resource "azurerm_mssql_server" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.mssql_version
  administrator_login          = var.administrator_login_name
  administrator_login_password = local.administrator_login_password

  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value.type
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
