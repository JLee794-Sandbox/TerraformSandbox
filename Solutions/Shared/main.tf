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
    container_name       = "fmc-terraform-sandbox"
    resource_group_name  = "validation-rg"
    storage_account_name = "tfstateadoutilities"
    key                  = "shared.demo.tfstate"
  }
}

provider "azurerm" {
  features {}
}
