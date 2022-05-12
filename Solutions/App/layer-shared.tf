#
# Shared-layer resources
# ------------------------------------------------------------
// module "shared-rg" {
//   source = "../../Modules/resourcegroup"

//   name     = module.azurecaf-shared.results["azurerm_resource_group"]
//   location = module.azurecaf-shared.location

//   tags = module.azurecaf-shared.tags
// }

// module "storage" {
//   source = "../../Modules/storage"

//   name                  = module.azurecaf-shared.results["azurerm_storage_account"]
//   resource_group_name   = module.shared-rg.name
//   location              = module.shared-rg.location
  
//   account_tier          = var.account_tier
//   soft_delete_retention = var.soft_delete_retention
//   containers            = var.containers

//   tags = module.shared-rg.tags
// }

// module "key-vault" {
//   source = "../../Modules/keyvault"

//   name                = module.azurecaf-shared.results["azurerm_key_vault"]
//   resource_group_name = module.shared-rg.name
//   location            = module.shared-rg.location

//   sku_name            = var.sku_name
//   access_policy       = var.access_policy

//   tags = module.shared-rg.tags
// }