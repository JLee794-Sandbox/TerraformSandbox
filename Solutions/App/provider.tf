terraform {
  required_providers {
    azurerm = "~> 2.93.0"
  }

  # TODO - Managed identity implementation once self-hosted agent is ready
  backend "azurerm" {
    resource_group_name  = "bootstrap"
    storage_account_name = "bootstrapsadev"
    container_name       = "tfstate"
    key                  = "parts-poc/app.tfstate"
  }
}

provider "azurerm" {
  features {}
}
