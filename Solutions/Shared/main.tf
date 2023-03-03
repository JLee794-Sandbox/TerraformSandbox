terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    azurerm = {
      version = ">=3.44.1"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
