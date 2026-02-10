terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
#   backend "azurerm" {
#     resource_group_name  = ""
#     storage_account_name = ""
#     container_name       = ""
#     key                  = ""
#   }
}

provider "azurerm" {
  features {}
  subscription_id = "0e01e4d0-ef71-4105-81fd-346e52ee7351"
}
