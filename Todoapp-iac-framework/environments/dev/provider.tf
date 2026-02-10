terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-dhondu"
  #   storage_account_name = "mydevopsinsidersstate"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "0e01e4d0-ef71-4105-81fd-346e52ee7351"
}
