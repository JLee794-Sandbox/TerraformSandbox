module "keyvault" {
  source = "../../Modules/security/keyvault"

  settings = {
    name = local.deploymentName

    sku_name                        = "standard" # standard or premium
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = true
    purge_protection_enabled        = false

    resource_group_key        = "app_rg"
    enable_rbac_authorization = false
    creation_policies = {
      logged_in_user = {
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover", "GetIssuers", "SetIssuers", "ListIssuers", "DeleteIssuers", "ManageIssuers", "Restore", "ManageContacts"]
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge"]
        key_permissions         = ["Get", "List", "Delete", "Create", "Purge", "Recover", "Backup", "Restore", "Import", "GetRotationPolicy", "SetRotationPolicy", "Rotate", "Verify"]
      }
      app_service = {
        object_id               = module.linux_webapp.rbac_id
        certificate_permissions = ["Get", "List", "GetIssuers", "ListIssuers"]
        secret_permissions      = ["Get", "List"]
        key_permissions         = ["Get", "List"]
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
          subnet_id = data.azurerm_subnet.data.id
        }
        devops_subnet = {
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


module "mssql_server" {
  source = "../../Modules/databases/mssql_server"
  # depends_on = [module.keyvault_access_policies, module.keyvault_access_policies_azuread_apps]
  global_settings = local.global_settings
  client_config   = local.client_config

  settings = local.mssql_server_settings

  resource_groups = local.resource_groups

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  keyvault_id         = module.keyvault.id

  base_tags = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
}

module "mssql_dbs" {
  source   = "../../Modules/databases/mssql_database"
  for_each = var.databases

  cloud = {
    sqlServerHostname = module.mssql_server.fully_qualified_domain_name
  }
  global_settings = local.global_settings
  location        = module.resource_group.location
  server_name     = module.mssql_server.name
  server_id       = module.mssql_server.id

  settings = each.value

  base_tags = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
}
