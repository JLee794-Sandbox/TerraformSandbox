output "azurerm_linux_web_app" {
  value = azurerm_linux_web_app.this
}


output "identity" {
  value       = azurerm_linux_web_app.this.identity.*
  description = "Managed or System Identity block"
}

output "identity_principal_id" {
  value = azurerm_linux_web_app.this.identity.0.principal_id
}
