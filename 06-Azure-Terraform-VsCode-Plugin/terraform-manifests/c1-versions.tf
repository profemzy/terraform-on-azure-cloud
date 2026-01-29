# Terraform Block
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

# Provider Block
provider "azurerm" {
  subscription_id = "675ec6f5-d0e6-4d1e-a3b5-f9c3f3508ba5"
  features {}
}
#
