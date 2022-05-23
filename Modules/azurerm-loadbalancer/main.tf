# -
# - Internal Load Balancer
# - Currently only accommodates private IPs

resource "azurerm_lb" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku      = var.sku
  sku_tier = var.sku_tier

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configurations
    content {
      name      = frontend_ip_configuration.key
      subnet_id = frontend_ip_configuration.value.subnet_id

      zones                         = lookup(frontend_ip_configuration.value, "zones", [])
      private_ip_address_allocation = lookup(frontend_ip_configuration.value, "private_ip_address_allocation", null)
      private_ip_address_version    = lookup(frontend_ip_configuration.value, "private_ip_address_version", "IPv4")
      private_ip_address            = lookup(frontend_ip_configuration.value, "private_ip_address", null)
    }
  }

  tags = var.tags
}
