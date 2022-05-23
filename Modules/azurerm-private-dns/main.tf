# -
# - Azure Private DNS Zone
# -
resource "azurerm_private_dns_zone" "this" {
  name                = var.fqdn
  resource_group_name = var.resource_group_name

  tags = var.tags
}

data "azurerm_virtual_network" "this" {
  count               = var.vnet_id == "" ? 1 : 0
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name == "" ? var.resource_group_name : var.vnet_resource_group_name
}

locals {
  vnet_id = var.vnet_id == "" ? data.azurerm_virtual_network.this[0].id : var.vnet_id
}

# -
# - Azure Private DNS Zone Link to VNet
# -
resource "azurerm_private_dns_zone_virtual_network_link" "dns-zone-to-vnet-link" {
  name                  = "${var.fqdn}-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = local.vnet_id

  tags = var.tags
}
