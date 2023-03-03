module "diagnostics" {
  source = "../../diagnostics"
  count  = var.diagnostics == null || var.diagnostics == {} ? 0 : 1

  resource_id       = azurerm_key_vault.keyvault.id
  resource_location = azurerm_key_vault.keyvault.location
  diagnostics       = var.diagnostics
  profiles          = try(var.settings.diagnostic_profiles, {})
}
