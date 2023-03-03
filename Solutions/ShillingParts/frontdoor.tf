module "frontdoor" {
  source = "../../Modules/networking/azurerm-frontdoor"

  name                = local.deploymentName
  resource_group_name = module.resource_group.name

  backend_host_header = "www.bing.com"
  backend_address     = "www.bing.com"
  backend_https_port  = 443
  backend_http_port   = 80

  backend_pools_send_receive_timeout_seconds   = 60
  enforce_backend_pools_certificate_name_check = false

  tags            = local.base_tags
  global_settings = local.global_settings
}
