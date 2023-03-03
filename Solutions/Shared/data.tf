data "azurerm_client_config" "current" {}

data "azuread_group" "admins" {
  count            = var.azuread_group_id == null ? 1 : 0
  display_name     = var.azuread_group_name
  security_enabled = true
}

data "azurerm_subnet" "devops" {
  name                 = var.devops_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_resource_group_name
}

data "http" "ip" {
  url = "https://ifconfig.me/ip"
}
