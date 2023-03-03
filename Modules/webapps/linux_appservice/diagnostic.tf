module "diagnostics" {
  source = "../../diagnostics"
  count  = var.diagnostic_profiles == null || var.diagnostic_profiles == {} ? 0 : 1

  resource_id       = azurerm_linux_web_app.app_service.id
  resource_location = var.location
  diagnostics       = var.diagnostics
  profiles          = var.diagnostic_profiles
}
