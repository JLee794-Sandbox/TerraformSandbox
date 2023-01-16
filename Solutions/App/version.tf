terraform {
  required_providers {
    azurerm = {
      version = "3.4.0"
    }
  }
  # backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
