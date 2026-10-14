terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0" #important for production environment
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}