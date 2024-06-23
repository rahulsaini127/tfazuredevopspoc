terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = "store-rg"
  location = "North Europe"
}

resource "azurerm_storage_account" "test" {
  name                = "maitreystorageaccount"
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  account_tier        = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "development"
  }
}
