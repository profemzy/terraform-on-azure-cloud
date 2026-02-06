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
      version = ">= 3.6"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
  }
  # Terraform State Storage to Azure Storage Container (Values will be taken from Azure DevOps)
  backend "azurerm" {

  }
}

# Provider Block
provider "azurerm" {
  features {}
}


