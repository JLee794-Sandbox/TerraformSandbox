#
# Network
# ------------------------------------------------------------
module "network-rg" {
  source = "../../Modules/resourcegroup"

  name     = var.network_rg_name
  location = var.location

  tags = {}
}

module "network" {
  source = "../../Modules/networking"

  resource_group_name = module.network-rg.name
  virtual_networks    = var.virtual_networks
  vnet_peering        = var.vnet_peering
  subnets             = var.subnets
}

// module "network-security-group" {
//   source = "../../Modules/networksecuritygroup"

//   resource_group_name = module.network-rg.name
//   network_security_groups = var.network_security_groups
// }

#
# App Services
# TODO - Add App Service plan
# ------------------------------------------------------------
module "app-rg" {
  source = "../../Modules/resourcegroup"

  name     = var.app_rg_name
  location = var.location

  tags = {}
}

module "storage" {
  source = "../../Modules/storage"

  name                  = var.storage_account_name
  resource_group_name   = module.app-rg.name
  location              = module.app-rg.location
  account_tier          = var.account_tier
  soft_delete_retention = var.soft_delete_retention
  containers            = var.containers

  tags = module.app-rg.tags
}

module "key-vault" {
  source = "../../Modules/keyvault"

  name                = var.key_vault_name
  resource_group_name = module.app-rg.name
  location            = module.app-rg.location
  sku_name            = var.sku_name
  access_policy       = var.access_policy

  tags = module.app-rg.tags
}

#
# FrontDoor
# ------------------------------------------------------------


#
# Azure SQL
# ------------------------------------------------------------
module "db-rg" {
  source = "../../Modules/resourcegroup"

  name     = var.db_rg_name
  location = var.location

  tags = {}
}