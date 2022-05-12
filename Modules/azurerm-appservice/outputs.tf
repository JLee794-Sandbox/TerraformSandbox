output "app-service-environment-object" {
  value = azurerm_app_service_environment_v3.this
}

output "app-service-plan-object" {
  value = azurerm_service_plan.this
}
