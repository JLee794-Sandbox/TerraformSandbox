output "id" {
  value = azurerm_private_endpoint.this.id
}

output "dns_a_record_id" {
  value = azurerm_private_dns_a_record.this.id
}

output "dns_a_record_fqdn" {
  value = azurerm_private_dns_a_record.this.fqdn
}
