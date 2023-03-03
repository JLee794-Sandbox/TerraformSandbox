module "diagnostics" {
  source = "../diagnostics"
  count  = var.diagnostic_profiles == null || var.diagnostic_profiles == {} ? 0 : 1

  resource_id       = azurerm_application_insights.appinsights.id
  resource_location = var.location
  diagnostics       = var.diagnostics
  profiles          = var.diagnostic_profiles
}
