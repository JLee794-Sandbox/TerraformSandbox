#
# Shared-layer resources
# ------------------------------------------------------------
module "shared-rg" {
  source = "../../Modules/azurerm-resourcegroup"

  name     = module.azurecaf-shared.results["azurerm_resource_group"]
  location = module.azurecaf-shared.location

  tags = module.azurecaf-shared.tags
}

module "storage" {
  source = "../../Modules/azurerm-storage"

  name                = module.azurecaf-shared.results["azurerm_storage_account"]
  resource_group_name = module.shared-rg.name
  location            = module.shared-rg.location

  account_tier = var.account_tier
  containers   = var.containers

  tags = module.shared-rg.tags

}

module "key-vault" {
  source = "../../Modules/azurerm-keyvault"

  name                = module.azurecaf-shared.results["azurerm_key_vault"]
  resource_group_name = module.shared-rg.name
  location            = module.shared-rg.location

  sku_name      = var.sku_name
  access_policy = var.access_policy

  tags = module.shared-rg.tags
}
