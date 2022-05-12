data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.sku_name

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = data.azurerm_client_config.current.object_id
    secret_permissions = ["Get"]
  }

  dynamic "access_policy" {
    for_each = var.access_policy
    content {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = access_policy.value["object_id"]
      certificate_permissions = access_policy.value["certificate_permissions"]
      key_permissions         = access_policy.value["key_permissions"]
      secret_permissions      = access_policy.value["secret_permissions"]
    }
  }
  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}
