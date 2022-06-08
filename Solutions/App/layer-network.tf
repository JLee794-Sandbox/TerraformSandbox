
#
# Network-layer resources
# TODO: Add logic for log analytics workspaces (one per region)
# ------------------------------------------------------------
module "network-rg" {
  source = "../../Modules/azurerm-resourcegroup"

  name     = module.azurecaf-network.results["azurerm_resource_group"]
  location = module.azurecaf-network.location

  tags = module.azurecaf-network.tags
}

module "frontdoor-nsg" {
  source = "../../Modules/azurerm-networksecuritygroup"

  resource_group_name     = module.network-rg.name
  location                = module.network-rg.location
  network_security_groups = var.network_security_groups

}

// TODO: Determine WAF policies to implement for frontdoor WAF
// module "frontdoor-waf" {
//   source = "../../Modules/networksecuritygroup"

//   resource_group_name = module.network-rg.name
//   network_security_groups = var.network_security_groups
// }


// NOTE: If you are getting errors about a resource group not being found
//       for frontdoor module, you may need to comment out the module below
//       for the initial deployment, then add it back once the resource group
//       exists in the Azure portal. (AzureRM provider issue)
module "frontdoor" {
  source = "../../Modules/azurerm-frontdoor"

  name                = module.azurecaf-network.results["azurerm_frontdoor"]
  resource_group_name = module.network-rg.name

  backend_host_header = "www.bing.com"
  backend_address     = "www.bing.com"
  backend_https_port  = 443
  backend_http_port   = 80

  tags = module.azurecaf-network.tags
}

module "private-dns" {
  source = "../../Modules/azurerm-private-dns"

  # fqdn = "tftestpe.eastus.cloudapp.azure.com"

  fqdn                = "${module.azurecaf-network.results["azurerm_private_dns_zone"]}.local"
  resource_group_name = module.network-rg.name
  location            = module.azurecaf-network.location

  vnet_id = var.vnet_id

  tags = module.azurecaf-network.tags
}

module "mssql-private-endpoint" {
  source = "../../Modules/azurerm-private-endpoint"

  name                = "${module.azurecaf-network.results["azurerm_private_endpoint"]}-mssql"
  resource_group_name = module.network-rg.name
  location            = module.azurecaf-network.location

  private_dns_zone_name          = module.private-dns.name
  private_connection_resource_id = module.mssql-server.id
  subresource_names              = ["sqlServer"]
  subnet_id                      = var.subnet_id

  tags = module.azurecaf-data.tags
}

module "storage-account-private-endpoint" {
  source = "../../Modules/azurerm-private-endpoint"

  name                = "${module.azurecaf-network.results["azurerm_private_endpoint"]}-sa"
  resource_group_name = module.network-rg.name
  location            = module.azurecaf-network.location

  private_dns_zone_name          = module.private-dns.name
  private_connection_resource_id = module.storage.id
  subresource_names              = ["blob"]
  # subresource_names = ["blob", "file", "queue", "table", "web"]
  subnet_id = var.subnet_id

  tags = module.azurecaf-data.tags
}

# module "ilb" {
#   source = "../../Modules/azurerm-loadbalancer"

#   name                = module.azurecaf-network.results["azurerm_load_balancer"]
#   resource_group_name = module.network-rg.name

#   frontend_ip_configurations = var.frontend_ip_configurations
#   sku_tier                  = var.sku_tier
#   sku                       = var.sku

#   tags = module.azurecaf-network.tags
# }
