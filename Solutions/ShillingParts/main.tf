terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    azurerm = {
      version = ">=3.44.1"
    }
  }
  backend "azurerm" {
    # container_name       = "fmc-terraform-sandbox"
    # resource_group_name  = "validation-rg"
    # storage_account_name = "tfstateadoutilities"
    # key                  = "shillingParts.demo.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
      # recover_soft_deleted_key_vaults = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


module "resource_group" {
  source = "../../Modules/resource_group"

  resource_group_name = local.deploymentName

  global_settings = local.global_settings
  settings        = {}
  tags            = local.base_tags
}
