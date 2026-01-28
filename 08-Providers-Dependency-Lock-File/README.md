---
title: Terraform Provider Dependency Lock File
description: Learn about Terraform Provider Dependency Lock File
---

## Step-01: Introduction
- Understand the importance of Dependency Lock File which is introduced in `Terraform v0.14` onwards

## Step-02: Create or Review c1-versions.tf
- c1-versions.tf
1. Discuss about Terraform, Azure and Random Pet Provider Versions
2. Discuss about Azure RM Provider version `4.58.0`
3. In provider block, `features {}` block is required in Azure RM provider 2.x and above
4. Also discuss about Random Provider
5. [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
```t
# Terraform Block
terraform {
  required_version = ">= 1.5"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.58.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.8.1"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
  subscription_id = "<SUBSCRIPTION_ID>"
}
```  
## Step-03: Create or Review c2-resource-group-storage-container.tf
- c2-resource-group-storage-container.tf
1. Discuss about [Azure Resource Group Resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
2. Discuss about [Random String Resource](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)
3. Discuss about [Azure Storage Account Resource - Latest](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)
```t
# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg1" {
  name = "myrg-1"
  location = "East US"
}

# Resource-2: Random String 
resource "random_string" "myrandom" {
  length = 16
  upper = false 
  special = false
}

# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.myrg1.name
  location                 = azurerm_resource_group.myrg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
```
## Step-04: Initialize and apply the configuration
```t
# Initialize Terraform and create the lock file
terraform init -upgrade

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan

# Create Resources using Terraform Apply
terraform apply
```
- Discuss about following 3 items in `.terraform.lock.hcl`
1. Provider Version
2. Version Constraints 
3. Hashes


## Step-05: Upgrade provider versions and refresh the lock file
- When a newer provider patch is available, update the constraint and run `terraform init -upgrade` to refresh `.terraform.lock.hcl`
```t
# Example: bump the Azure provider constraint to a newer patch
version = "~> 4.58"

# Upgrade provider versions and refresh lock file
terraform init -upgrade
```

## Step-06: Run Terraform Plan and Apply
- Everything should pass and Storage account should use StorageV2 defaults
```t
# Terraform Plan
terraform plan

# Terraform Apply
terraform apply
```


## Step-07: Clean-Up
```t
# Destroy Resources
terraform destroy

# Delete Terraform Files
rm -rf .terraform    
rm -rf .terraform.lock.hcl

# Delete Terraform State File
rm -rf terraform.tfstate*
```

## References
- [Random Pet Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)
- [Dependency Lock File](https://www.terraform.io/docs/configuration/dependency-lock.html)
- [Terraform New Features in v0.14](https://learn.hashicorp.com/tutorials/terraform/provider-versioning?in=terraform/0-14)
