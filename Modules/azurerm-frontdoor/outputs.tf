output "frontdoor_object" {
  value = azurerm_frontdoor.this
}

output "custom_https_configuration_object" {
  value = azurerm_frontdoor_custom_https_configuration.this
}
