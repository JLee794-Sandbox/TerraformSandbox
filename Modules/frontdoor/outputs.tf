output "front-door-object" {
  value = azurerm_frontdoor.this
}

output "front-door-waf-object" {
  value = azurerm_frontdoor_firewall_policy.this
}
