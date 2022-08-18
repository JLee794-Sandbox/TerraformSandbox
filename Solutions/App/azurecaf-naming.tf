# naming.tf
#
# This file leverages the azurecaf module to
#   create formatted names and tags for the
#   relevant Azure resources per layer
# ------------------------------------------------

locals {
  # These tags will be merged with the current tagging
  #   standards specified within the Modules/azurecaf-naming/outputs.tf
  #   file.
  additional_tags = merge(
    var.tags,
    {
      Provisioner = "Terraform"
      Customer    = "FMC"
    }
  )

  # Layer specific tags
  app_layer_tags     = {}
  data_layer_tags    = {}
  network_layer_tags = {}
  shared_layer_tags  = {}
}

#
# Shared_layer specific naming
# ------------------------------------------------
module "azurecaf-shared" {
  source = "../../Modules/azurecaf-naming"

  country_code     = var.country_code
  environment_code = var.environment_code
  application_name = var.application_name
  resource_types = [
    "azurerm_resource_group",
    "azurerm_key_vault",
    "azurerm_storage_account"
  ]
  location = var.location
  owner    = var.owner

  prefix = var.prefix
  suffix = "shared"
  tags   = merge(local.additional_tags, local.shared_layer_tags)
}

#
# Application_layer specific naming
# ------------------------------------------------
module "azurecaf-app" {
  source = "../../Modules/azurecaf-naming"

  country_code     = var.country_code
  environment_code = var.environment_code
  application_name = var.application_name
  resource_types = [
    "azurerm_resource_group",
    "azurerm_app_service_plan",
    "azurerm_app_service"
  ]
  location = var.location
  owner    = var.owner

  prefix = var.prefix
  suffix = "app"
  tags   = merge(local.additional_tags, local.app_layer_tags)
}

#
# Data_layer specific naming
# ____________________________________________________________
module "azurecaf-data" {
  source = "../../Modules/azurecaf-naming"

  country_code     = var.country_code
  environment_code = var.environment_code
  application_name = var.application_name
  resource_types = [
    "azurerm_mssql_server",
    "azurerm_mssql_database",
  ]
  location = var.location
  owner    = var.owner

  prefix = var.prefix
  suffix = "data"
  tags   = merge(local.additional_tags, local.data_layer_tags)
}

#
# Networking_layer specific naming
# ____________________________________________________________
module "azurecaf-network" {
  source = "../../Modules/azurecaf-naming"

  country_code     = var.country_code
  environment_code = var.environment_code
  application_name = var.application_name
  resource_types = [
    "azurerm_frontdoor",
    "azurerm_frontdoor_firewall_policy",
    "azurerm_network_security_group",
    "azurerm_network_security_rule",
    "azurerm_private_dns_zone",
    "azurerm_private_endpoint",
    "azurerm_private_link_service"
  ]
  location = var.location
  owner    = var.owner

  prefix = var.prefix
  suffix = "network"
  tags   = merge(local.additional_tags, local.network_layer_tags)
}
