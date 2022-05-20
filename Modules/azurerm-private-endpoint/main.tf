# -
# - Private Endpoint + DNS A Record
# -
resource "azurerm_private_endpoint" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-psc"
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection           = "false" # True if the connection requires manual approval
  }

  tags = var.tags
}

data "azurerm_private_endpoint_connection" "this" {
  name                = azurerm_private_endpoint.this.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_a_record" "this" {
  name                = lower(azurerm_private_endpoint.this.name)
  zone_name           = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [data.azurerm_private_endpoint_connection.this.private_service_connection.0.private_ip_address]
}
