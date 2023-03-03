module "resource_group" {
  source = "../../Modules/resource_group"

  resource_group_name = local.deploymentName

  global_settings = local.global_settings
  settings        = {}
  tags            = local.base_tags
}

locals {
  resource_groups = {
    devops_rg = module.resource_group
  }
}

module "keyvault" {
  source = "../../Modules/security/keyvault"

  settings = {
    name = local.deploymentName

    sku_name                        = "standard" # standard or premium
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = true
    purge_protection_enabled        = true

    resource_group_key = "devops_rg"

    creation_policies = {
      logged_in_user = {
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover", "GetIssuers", "SetIssuers", "ListIssuers", "DeleteIssuers", "ManageIssuers", "Restore", "ManageContacts"]
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge"]
        key_permissions         = ["Get", "List", "Delete", "Create", "Purge", "Recover", "Backup", "Restore", "Import", "GetRotationPolicy", "SetRotationPolicy", "Rotate", "Verify"]
      }
      azuread_group_key = {
        group_object_id         = local.azuaread_group_id
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover", "GetIssuers", "SetIssuers", "ListIssuers", "DeleteIssuers", "ManageIssuers", "Restore", "ManageContacts"]
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge"]
        key_permissions         = ["Get", "List", "Delete", "Create", "Purge", "Recover", "Backup", "Restore", "Import", "GetRotationPolicy", "SetRotationPolicy", "Rotate", "Verify"]
      }
    }

    network = {
      bypass         = "AzureServices" # AzureServices or None
      default_action = "Deny"
      ip_rules       = [data.http.ip.response_body]
      subnets = {
        app_subnet = {
          subnet_id = data.azurerm_subnet.devops.id
        }
      }
    }
  }
  global_settings = local.global_settings
  client_config   = local.client_config
  resource_groups = local.resource_groups
  base_tags       = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
}

module "linux_devops_vm" {
  source = "../../Modules/compute/virtual_machines/linux_devops"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  name                = local.deploymentName
  key_vault           = module.keyvault
  admin_username      = "devopsadmin"
  subnet_id           = data.azurerm_subnet.devops.id

  global_settings = local.global_settings
  base_tags       = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
}
