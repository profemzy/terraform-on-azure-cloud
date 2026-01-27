# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Terraform training course repository** focused on Azure Infrastructure as Code (IaC). It contains 38+ modules demonstrating real-world Azure service configurations using Terraform, progressing from basic concepts to advanced DevOps and SRE patterns.

Each module directory (numbered 01-38) represents a self-contained learning exercise with:
- A README.md explaining concepts and implementation steps
- A `terraform-manifests/` directory containing all Terraform configuration files

**This is not a traditional software project** - it's educational material with hands-on exercises for learning Terraform on Azure.

## Common Terraform Commands

When working with any module's `terraform-manifests/` directory:

```bash
# Initialize working directory and download providers
terraform init

# Validate configuration syntax
terraform validate

# Format Terraform configuration files
terraform fmt

# Preview changes without applying
terraform plan

# Apply configuration changes
terraform apply

# Apply with auto-approval (use with caution)
terraform apply -auto-approve

# Destroy all infrastructure in the configuration
terraform destroy
```

**Important:** Always run `terraform init` when:
- First working with a module
- After cloning the repository
- After pulling changes that affect providers or modules

## Module Structure and Patterns

### File Naming Convention
Each module uses a sequential prefix to indicate the logical order of operations:

- `c1-versions.tf` - Terraform version and provider requirements
- `c2-*.tf` - Input variables
- `c3-*.tf` and beyond - Resource definitions, local values, datasources
- `outputs.tf` - Output values
- `terraform.tfvars` - Variable assignment values

### Terraform Block Pattern
All modules follow this version pinning approach:

```hcl
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

### Variable Naming Convention
Standard variables used across most modules:

```hcl
business_divsion = "hr"       # Business unit identifier
environment = "dev"            # Environment (dev, qa, prod)
resource_group_name = "rg"     # Base resource group name
resource_group_location = "eastus"  # Azure region
```

## Architecture Progression

The modules follow a **progressive learning path**:

1. **Modules 01-09**: Terraform fundamentals (IaC concepts, CLI, syntax, providers, resources)
2. **Modules 10-15**: Foundation Azure services (Virtual Networks, VMs, Bastion, Load Balancers)
3. **Modules 16-20**: Advanced Terraform (count, for_each) and Scale Sets
4. **Modules 21-23**: DNS (Private zones, delegation, Public DNS)
5. **Modules 24-25**: Remote State and Traffic Manager
6. **Modules 26-31**: Application Gateway (path routing, multisite, SSL with KeyVault)
7. **Modules 32-33**: DevOps integration (Azure DevOps) and databases (MySQL)
8. **Modules 34-38**: Terraform modules (public, local, publishing, sources)

When making changes across modules, **respect this progression** - don't introduce advanced concepts in early modules.

## Key Terraform Concepts Demonstrated

### Meta-Arguments
- **count**: Module 16 - Create multiple resource instances
- **for_each**: Module 17 - Loop over collections for resource creation
- **depends_on**: Explicit dependency management
- **lifecycle**: Resource lifecycle management

### State Management
- **Local state**: Default in early modules
- **Remote state**: Module 24 - Azure Storage Account backend
- **Remote state datasource**: Module 25 - Reference state from other configurations

### Provisioners
- **file**: Copy files to resources
- **remote-exec**: Execute scripts on remote resources
- **local-exec**: Execute commands locally

### Modules
- **Public registry modules**: Module 34 - Consume modules from Terraform Registry
- **Local modules**: Module 36 - Build and use modules in the same repository
- **Publishing**: Module 37 - Publish modules to Terraform Public Registry

## Working with Azure Resources

### Common Azure Services Used
- **Resource Groups**: Containers for Azure resources
- **Virtual Networks**: Network isolation with subnets
- **Network Security Groups**: Allow/deny traffic rules
- **Virtual Machines**: Compute resources
- **Load Balancers**: Distribute traffic (Standard SKU)
- **Application Gateway**: Web traffic load balancing with Layer 7 capabilities
- **Virtual Machine Scale Sets**: Auto-scaling compute groups
- **DNS Zones**: Private and Public DNS management
- **Traffic Manager**: DNS-based traffic routing across regions

### Naming Conventions
Resources typically use naming patterns like:
```
<business_divsion>-<environment>-<resource-type>-<suffix>
Example: hr-dev-webvm-1
```

The `random_string` resource is often used to generate unique suffixes for globally-unique resources.

## Important Notes

### Prerequisites for Running Any Module
- Active Azure subscription
- Azure CLI installed and authenticated (`az login`)
- Terraform CLI installed (version >= 1.0.0)
- Appropriate Azure permissions to create resources

### Cost Considerations
- Many modules create real Azure resources that incur costs
- Always run `terraform destroy` after completing a module to avoid ongoing charges
- Some modules use Azure DevOps which may require separate billing

### Module Independence
Each module is designed to be **standalone**. You can:
- Work on modules in any order (though sequential is recommended for learning)
- Run modules independently without dependencies on other modules
- Destroy infrastructure from one module without affecting others

## Azure DevOps Integration (Module 32)

Module 32 demonstrates CI/CD with Azure DevOps pipelines. Key pipeline tasks:
```yaml
- task: TerraformInstaller@0
- task: TerraformCLI@0
    command: init
- task: TerraformCLI@0
    command: validate
- task: TerraformCLI@0
    command: plan
    commandOptions: -out=tfplan
- task: TerraformCLI@0
    command: apply
    commandOptions: tfplan
```

## Git Repository Information

- **Primary repo**: https://github.com/stacksimplify/terraform-on-azure-cloud
- **Azure DevOps companion**: https://github.com/stacksimplify/terraform-on-azure-with-azure-devops

This is a training repository from Stack Simplify's Udemy course on Terraform for Azure.
