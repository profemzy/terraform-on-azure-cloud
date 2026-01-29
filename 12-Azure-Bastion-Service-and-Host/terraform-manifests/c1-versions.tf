# Terraform Block
terraform {
  required_version = ">= 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.58.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.8.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~>3.2.4"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
  subscription_id = "675ec6f5-d0e6-4d1e-a3b5-f9c3f3508ba5"
}
