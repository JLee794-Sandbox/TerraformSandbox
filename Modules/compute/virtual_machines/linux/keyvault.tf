locals {
  keyvault = var.keyvault != null ? var.keyvault : local.create_sshkeys ? try(var.keyvaults[var.settings.lz_key][var.settings.keyvault_key], var.keyvaults[var.client_config.landingzone_key][var.settings.keyvault_key]) : null
}
