#
# Shared resources
# ------------------------------------------------------------
module "app-rg" {
  source = "../../Modules/azurerm-resourcegroup"

  name     = module.azurecaf-app.results["azurerm_resource_group"]
  location = module.azurecaf-app.location

  tags = module.azurecaf-app.tags
}

module "storage" {
  source = "../../Modules/azurerm-storage"

  name                = module.azurecaf-shared.results["azurerm_storage_account"]
  resource_group_name = module.app-rg.name
  location            = module.app-rg.location

  account_tier = var.account_tier
  containers   = var.containers

  tags = module.app-rg.tags

}

module "key-vault" {
  source = "../../Modules/azurerm-keyvault"

  name                = module.azurecaf-shared.results["azurerm_key_vault"]
  resource_group_name = module.app-rg.name
  location            = module.app-rg.location

  sku_name      = var.sku_name
  access_policy = var.access_policy

  tags = module.app-rg.tags
}
