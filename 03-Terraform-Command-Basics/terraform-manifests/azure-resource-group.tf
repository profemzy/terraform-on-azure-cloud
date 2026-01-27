# Terraform Settings Block
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0" # Optional but recommended in production
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "my_demo_rg1" {
  location = "westus"
  name     = "my-demo-rg1"
}
