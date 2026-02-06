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
  }
  # Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "terraformstatewakopsaks"
    container_name       = "tfstatefiles"
    key                  = "project-1-eastus2-terraform.tfstate"
  }
}

# Provider Block
provider "azurerm" {
}

# Simple Comment
