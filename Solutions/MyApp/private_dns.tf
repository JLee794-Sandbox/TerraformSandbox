module "private_dns" {
  source = "../../Modules/networking/private-dns"

  name                = var.private_dns_fqdn
  resource_group_name = module.resource_group.name
  client_config       = local.client_config
  records             = {}
  vnet_links = {
    app_vnet_link = {
      name               = local.deploymentName
      global_settings    = local.global_settings
      virtual_network_id = data.azurerm_virtual_network.app_vnet.id
      tags               = local.base_tags
    }
  }

  base_tags       = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
  global_settings = local.global_settings
}

module "mssql_private_endpoint" {
  source = "../../Modules/networking/private_endpoint"

  name                = "${local.deploymentName}_mssql"
  resource_id         = module.mssql_server.id
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = data.azurerm_subnet.data.id

  settings = {
    private_dns = {
      zone_group_name = local.deploymentName
      ids             = [module.private_dns.id]
    }
    private_service_connection = {
      name                 = "${local.deploymentName}_mssql"
      is_manual_connection = false
      subresource_names    = ["sqlServer"]
    }
  }
  base_tags       = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
  global_settings = local.global_settings
}

# [For DevOps CICD Agents]:
#   If running into Error: reading static website for AzureRM Storage Account | Context Deadline Exceeded
#   - This is caused by the Private Endpoint for the Storage Account
#   - Bug being tracked within:
#     - https://github.com/hashicorp/terraform-provider-azurerm/issues/13889
#     - https://github.com/hashicorp/terraform-provider-azurerm/issues/20257
#   - Workaround is to disable the Private Endpoint for the Storage Account

# module "storage_private_endpoint" {
#   source = "../../Modules/networking/private_endpoint"

#   name                = "${local.deploymentName}_storage"
#   resource_id         = module.storage_account.id
#   resource_group_name = module.resource_group.name
#   location            = module.resource_group.location
#   subnet_id           = data.azurerm_subnet.data.id

#   settings = {
#     private_dns = {
#       zone_group_name = local.deploymentName
#       ids             = [module.private_dns.id]
#     }
#     private_service_connection = {
#       name                 = "${local.deploymentName}_storage"
#       is_manual_connection = false
#       subresource_names    = ["blob"]
#     }
#   }
#   base_tags       = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
#   global_settings = local.global_settings
# }
