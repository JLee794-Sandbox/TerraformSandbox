
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
