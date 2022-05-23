output "name" {
  value = azurerm_private_dns_zone.this.name
}

output "id" {
  value = azurerm_private_dns_zone.this.id
}

output "soa_record" {
  value = azurerm_private_dns_zone.this.soa_record
}

output "max_number_of_virtual_network_links" {
  value = azurerm_private_dns_zone.this.max_number_of_virtual_network_links
}

output "max_number_of_record_sets" {
  value = azurerm_private_dns_zone.this.max_number_of_record_sets
}

output "max_number_of_virtual_network_links_with_registration" {
  value = azurerm_private_dns_zone.this.max_number_of_virtual_network_links_with_registration
}
