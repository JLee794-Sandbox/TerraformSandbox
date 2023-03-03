output "id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "identity" {
  value = azurerm_linux_virtual_machine.this.identity
}

output "private_ip_address" {
  value = azurerm_linux_virtual_machine.this.private_ip_address
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.this.public_ip_address
}

output "virtual_machine_id" {
  value = azurerm_linux_virtual_machine.this.virtual_machine_id
}
