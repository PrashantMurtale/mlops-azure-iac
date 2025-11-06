terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">=1.5"
}

provider "azurerm" {
  features {}
  # Auth via service principal env vars or creds.json
}

# Data source for current workspace
data "azurerm_client_config" "current" {}

# Resource group named with workspace
resource "azurerm_resource_group" "main" {
  name     = "rg-mlops-${terraform.workspace}"
  location = main.location
}

# VNet for isolation (shared across VMs)
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-mlops-${terraform.workspace}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-mlops"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}