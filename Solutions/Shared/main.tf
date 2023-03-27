terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    azurerm = {
      version = ">=3.49.0"
    }
  }
  backend "azurerm" {
    container_name       = "fmc-terraform-sandbox"
    resource_group_name  = "validation-rg"
    storage_account_name = "tfstateadoutilities"
    key                  = "Shared.demo.tfstate"
  }
}

provider "azurerm" {
  features {}
}
