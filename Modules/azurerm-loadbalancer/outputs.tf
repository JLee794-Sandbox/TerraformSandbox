output "id" {
  value = azurerm_lb.this.id
}
output "frontend_ip_configuration" {
  value = azurerm_lb.this.frontend_ip_configuration.*
}
output "private_ip_address" {
  value = azurerm_lb.this.private_ip_address
}
output "private_ip_addresses" {
  value = azurerm_lb.this.private_ip_addresses
}

# Sample
# frontend_ip_configuration = tolist([
#   {
#     "gateway_load_balancer_frontend_ip_configuration_id" = ""
#     "id" = "/subscriptions/7386cd39-b109-4cc6-bb80-bf12413d0a99/resourceGroups/validation-rg/providers/Microsoft.Network/loadBalancers/tftest-ilb/frontendIPConfigurations/DynamicPrivateIPAddress"
#     "inbound_nat_rules" = toset([])
#     "load_balancer_rules" = toset([])
#     "name" = "DynamicPrivateIPAddress"
#     "outbound_rules" = toset([])
#     "private_ip_address" = "10.0.3.4"
#     "private_ip_address_allocation" = "Dynamic"
#     "private_ip_address_version" = "IPv4"
#     "public_ip_address_id" = ""
#     "public_ip_prefix_id" = ""
#     "subnet_id" = "/subscriptions/7386cd39-b109-4cc6-bb80-bf12413d0a99/resourceGroups/hubnetworkdevrg/providers/Microsoft.Network/virtualNetworks/hub/subnets/tf-test-subnet"
#     "zones" = toset(null) /* of string */
#   },
# ])
# id = "/subscriptions/7386cd39-b109-4cc6-bb80-bf12413d0a99/resourceGroups/validation-rg/providers/Microsoft.Network/loadBalancers/tftest-ilb"
# private_ip_address = "10.0.3.4"
# private_ip_addresses = tolist([
#   "10.0.3.4",
# ])
