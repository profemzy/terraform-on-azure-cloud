# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Project Overview

This is a **Terraform training course repository** focused on Azure Infrastructure as Code (IaC). It contains 38 educational modules demonstrating real-world Azure service configurations using Terraform, progressing from basic concepts to advanced DevOps and SRE patterns.

**Each module directory (numbered 01-38) represents a self-contained learning exercise.**

This is **educational material** for the Udemy course "Terraform on Azure with IaC DevOps and SRE | Real-World 25 Demos" by Stack Simplify.

**Primary Repository:** https://github.com/stacksimplify/terraform-on-azure-cloud  
**Azure DevOps Companion Repository:** https://github.com/stacksimplify/terraform-on-azure-with-azure-devops

---

## Technology Stack

### Core Technologies
- **Terraform**: Infrastructure as Code tool (required version `>= 1.5`)
- **Azure Provider**: HashiCorp AzureRM Provider (`~> 4.58.0`)
- **Random Provider**: HashiCorp Random Provider (`~> 3.8.1`)
- **Azure CLI**: For authentication and management (`az login`)

### Azure Services Covered
- Resource Groups, Virtual Networks, Subnets, Network Security Groups
- Virtual Machines (Linux), Network Interfaces, Public IPs
- Standard Load Balancers (External/Internal) with Inbound NAT Rules
- Virtual Machine Scale Sets (VMSS) with Manual and Auto-scaling
- Application Gateway (Context Path Routing, Multisite Hosting, SSL)
- Azure DNS (Private DNS Zones, Public DNS Zones)
- Traffic Manager (DNS-based traffic routing)
- Azure Storage Accounts (Static Websites, Blob Storage)
- Azure MySQL Single Server with Virtual Network Rules
- Azure Bastion Host and Bastion Service
- Azure Key Vault (for SSL certificates)

---

## Project Structure

### Top-Level Directory Layout

```
/Users/profemzy/projects/terraform-on-azure-cloud/
├── 01-Infrastructure-as-Code-IaC-Basics/           # IaC concepts and theory
├── 02-Install-Tools-TerraformCLI-AzureCLI-VSCodeIDE/  # Tool installation guides
├── 03-Terraform-Command-Basics/                    # terraform init, plan, apply
├── 04-Terraform-Language-Syntax/                   # HCL syntax fundamentals
├── 05-Terraform-Provider-Resource-Block-Basics/    # Provider configuration
├── 06-Azure-Terraform-VsCode-Plugin/               # IDE setup
├── 07-Multiple-Provider-Configurations/            # Multiple provider usage
├── 08-Providers-Dependency-Lock-File/              # .terraform.lock.hcl
├── 09-Resource-Syntax-and-Behavior/                # Resource lifecycle
├── 10-Azure-Virtual-Network-4Tier/                 # VNet, Subnets, NSGs
├── 11-Azure-Linux-Virtual-Machine/                 # VMs, NICs, Public IPs
├── 12-Azure-Bastion-Service-and-Host/              # Bastion Host and Service
├── 13-Azure-Standard-LoadBalancer-using-Portal/    # Manual LB setup
├── 14-Azure-Standard-LoadBalancer-Basic/           # LB with Terraform
├── 15-Azure-Standard-LoadBalancer-Inbound-NATRules/  # NAT rules
├── 16-Azure-SLB-VM-with-MetaArgument-Count/        # count meta-argument
├── 17-Azure-SLB-VM-with-for-each-and-for-loops/    # for_each meta-argument
├── 18-Azure-VM-ScaleSets-Manual-scaling/           # VMSS basics
├── 19-Azure-VM-ScaleSets-Auto-scaling/             # Autoscaling profiles
├── 20-Azure-External-and-Internal-LB-with-VMSS/    # Internal/External LB + VMSS
├── 21-Azure-Private-DNS-Zones/                     # Private DNS Zones
├── 22-Delegate-DNS-Domain-to-Azure-DNS/            # DNS delegation
├── 23-Azure-Public-DNS-Zone/                       # Public DNS Zones
├── 24-Terraform-Remote-State-Storage/              # Azure backend for state
├── 25-Azure-Traffic-Manager/                       # Multi-region with remote state
├── 26-Azure-Application-Gateway-using-Portal/      # AG manual setup
├── 27-Azure-Application-Gateway-Basics/            # AG with Terraform
├── 28-Azure-Application-Gateway-Path-Based-Routing/ # Context path routing
├── 29-Azure-Application-Gateway-Multisite-Hosting/ # Multisite hosting
├── 30-Azure-Application-Gateway-SSL-SelfSigned/    # SSL with self-signed certs
├── 31-Azure-Application-Gateway-SSL-SelfSigned-KeyVault/  # SSL with Key Vault
├── 32-Azure-IaC-DevOps/                            # Azure DevOps pipelines
├── 33-Azure-MySQL-Single-Server/                   # MySQL with Terraform
├── 34-Terraform-Modules-use-Public-Module/         # Using registry modules
├── 35-Terraform-Azure-Static-Website/              # Static website hosting
├── 36-Terraform-Modules-Build-Local-Module/        # Building local modules
├── 37-Terraform-Module-Publish-to-Public-Registry/ # Publishing to registry
├── 38-Terraform-Module-Sources/                    # Module source types
├── README.md                                       # Course overview
├── CLAUDE.md                                       # Additional Claude guidance
├── AGENTS.md                                       # This file
├── .gitignore                                      # Git ignore rules
└── git-deploy.sh                                   # Simple git push script
```

### Module-Level Structure

Each module directory (where applicable) follows this structure:

```
NN-Module-Name/
├── README.md                    # Learning objectives and step-by-step instructions
├── terraform-manifests/         # Terraform configuration files (main directory)
│   ├── c1-versions.tf          # Terraform and provider version constraints
│   ├── c2-generic-input-variables.tf  # Common input variables
│   ├── c2-*.tf                 # Additional variable files (specific to module)
│   ├── c3-locals.tf            # Local values for naming conventions
│   ├── c4-random-resources.tf  # Random string resources for unique names
│   ├── c5-resource-group.tf    # Resource group definition
│   ├── c6-01-vnet-input-variables.tf  # VNet-specific variables
│   ├── c6-02-virtual-network.tf       # Virtual network resource
│   ├── c6-03-web-subnet-and-nsg.tf    # Web subnet + NSG
│   ├── c6-04-app-subnet-and-nsg.tf    # App subnet + NSG
│   ├── c6-05-db-subnet-and-nsg.tf     # DB subnet + NSG
│   ├── c6-06-bastion-subnet-and-nsg.tf  # Bastion subnet + NSG
│   ├── c6-07-vnet-outputs.tf          # VNet-related outputs
│   ├── c7-*.tf                 # Virtual machine resources
│   ├── c8-*.tf                 # Bastion host resources
│   ├── c9-*.tf                 # Load balancer resources
│   ├── outputs.tf              # Output values
│   ├── terraform.tfvars        # Default variable values
│   ├── dev.tfvars              # Development environment values (some modules)
│   ├── qa.tfvars               # QA environment values (some modules)
│   ├── prod.tfvars             # Production environment values (some modules)
│   └── app-scripts/            # Shell scripts for VM initialization
│       └── redhat-webvm-script.sh
└── (additional directories for complex modules)
```

### Special Cases

Some modules have sub-projects:

- **24-Terraform-Remote-State-Storage/**: Contains `project-1-eastus2-vmss/` and related configurations
- **25-Azure-Traffic-Manager/**: Contains `project-1-eastus2-vmss/`, `project-2-westus2-vmss/`, `project-3-azure-traffic-manager/`
- **32-Azure-IaC-DevOps/**: Contains `Git-Repo-Files/` with pipeline backups and additional manifests
- **36-Terraform-Modules-Build-Local-Module/**: Contains `modules/azure-static-website/`
- **37-Terraform-Module-Publish-to-Public-Registry/**: Contains `terraform-azure-static-website-module-manifests/`

---

## File Naming Conventions

### Terraform Configuration Files

Files use a **sequential prefix (c1-, c2-, c3-, etc.)** to indicate logical order:

| Prefix | Purpose | Example |
|--------|---------|---------|
| `c1-versions.tf` | Terraform version and provider requirements | `c1-versions.tf` |
| `c2-*.tf` | Input variables | `c2-generic-input-variables.tf` |
| `c3-locals.tf` | Local values for naming conventions | `c3-locals.tf` |
| `c4-random-resources.tf` | Random string resources | `c4-random-resources.tf` |
| `c5-resource-group.tf` | Resource group resource | `c5-resource-group.tf` |
| `c6-*.tf` | Virtual network resources | `c6-02-virtual-network.tf` |
| `c7-*.tf` | Virtual machine resources | `c7-05-web-linuxvm-resource.tf` |
| `c8-*.tf` | Bastion host resources | `c8-02-bastion-host-linuxvm.tf` |
| `c9-*.tf` | Load balancer resources | `c9-02-web-loadbalancer-resource.tf` |
| `outputs.tf` | Output values | `outputs.tf` |
| `terraform.tfvars` | Variable assignments | `terraform.tfvars` |
| `*.tfvars` | Environment-specific values | `dev.tfvars`, `prod.tfvars` |

### Variable Naming Conventions

Standard variables used across most modules:

```hcl
variable "business_divsion" {      # Business unit identifier (e.g., "hr", "akowe")
  default = "hr"
}

variable "environment" {            # Environment name (dev, qa, stage, prod)
  default = "dev"
}

variable "resource_group_name" {    # Base resource group name
  default = "rg"
}

variable "resource_group_location" {# Azure region
  default = "eastus"
}
```

### Resource Naming Pattern

Resources are named using this pattern:
```
<business_divsion>-<environment>-<resource-type>-<suffix>

Examples:
- hr-dev-webvm-1
- akowe-dev-vnet
- myapp-prod-lb
```

The `random_string` resource generates unique suffixes for globally-unique resource names (e.g., storage accounts).

---

## Common Terraform Commands

When working with any module's `terraform-manifests/` directory:

```bash
# Initialize the working directory and download providers
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

# Destroy with auto-approval (use with extreme caution)
terraform destroy -auto-approve

# Re-download modules (after adding new module blocks)
terraform get
```

**Important:** Always run `terraform init` when:
- First working with a module
- After cloning the repository
- After pulling changes that affect providers or modules
- When adding new module blocks to your configuration

### Using Variable Files

```bash
# Use specific environment variable file
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"

# Override specific variables
terraform plan -var="environment=prod"
```

---

## Terraform Block Patterns

### Version and Provider Requirements

All modules follow this standard pattern in `c1-versions.tf`:

```hcl
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
}

# Provider Block
provider "azurerm" {
  features {}
}
```

### Older Modules

Some older modules may use slightly different version constraints:
- `required_version = ">= 1.0.0"`
- `version = ">= 2.0"` for azurerm provider

---

## Key Terraform Concepts Demonstrated

### Meta-Arguments

- **`count`**: Module 16 - Creates multiple resource instances from a single block
- **`for_each`**: Module 17 - Iterates over collections (maps, sets) for resource creation
- **`depends_on`**: Explicit dependency management between resources
- **`lifecycle`**: Resource lifecycle management (prevent_destroy, ignore_changes, create_before_destroy)

### State Management

- **Local State**: Default in early modules (state stored in `terraform.tfstate`)
- **Remote State**: Module 24 - Azure Storage Account as backend
- **Remote State Datasource**: Module 25 - Reference state from other configurations

**Remote State Backend Configuration** (Module 24+):
```hcl
terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-state-rg"
    storage_account_name  = "tfstatestorage"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
```

### Provisioners

- **`file`**: Copy files to remote resources
- **`remote-exec`**: Execute scripts on remote resources via SSH/WinRM
- **`local-exec`**: Execute commands on the local machine

### Modules

- **Public Registry Modules**: Module 34 - Consuming modules from Terraform Registry
- **Local Modules**: Module 36 - Building and using modules in the same repository
- **Publishing Modules**: Module 37 - Publishing modules to Terraform Public Registry

**Calling a Local Module**:
```hcl
module "azure_static_website" {
  source = "./modules/azure-static-website"
  
  # Module arguments (become module's input variables)
  location                          = "eastus"
  resource_group_name               = "myrg1"
  storage_account_name              = "staticwebsite"
  storage_account_tier              = "Standard"
  storage_account_replication_type  = "LRS"
  storage_account_kind              = "StorageV2"
  static_website_index_document     = "index.html"
  static_website_error_404_document = "error.html"
}
```

### Variable Types and Assignments

- **Basic variables**: String, number, bool
- **Collection types**: List, map, set
- **Assign when prompted**: No default value
- **Assign with `terraform.tfvars`**: Default variable values file
- **Assign with `-var-file`**: Environment-specific files (dev.tfvars, prod.tfvars)
- **Assign with `*.auto.tfvars`**: Automatically loaded variable files
- **Sensitive input variables**: Mark sensitive values with `sensitive = true`

---

## Architecture Progression

The modules follow a **progressive learning path**:

| Phase | Modules | Topics |
|-------|---------|--------|
| **Foundation** | 01-09 | Terraform fundamentals (IaC concepts, CLI, syntax, providers, resources, lock files) |
| **Basic Azure** | 10-15 | Core Azure services (VNet, Subnets, VMs, Bastion, Load Balancers) |
| **Advanced Terraform** | 16-20 | Meta-arguments (count, for_each) and VM Scale Sets |
| **DNS** | 21-23 | Private DNS, domain delegation, Public DNS |
| **State Management** | 24-25 | Remote state, backends, Traffic Manager |
| **Application Gateway** | 26-31 | Layer 7 load balancing, path routing, multisite, SSL, Key Vault |
| **DevOps & Databases** | 32-33 | Azure DevOps pipelines, MySQL with Terraform |
| **Reusability** | 34-38 | Modules (public, local, publishing, sources) |

**When making changes across modules, respect this progression** - do not introduce advanced concepts in early modules.

---

## Build and Test Process

### Build Process

This project does not have traditional software builds. The "build" process involves:

1. **Terraform Initialization** (`terraform init`)
   - Downloads required providers
   - Downloads modules (if using)
   - Configures backends (if using remote state)

2. **Configuration Validation** (`terraform validate`)
   - Validates syntax
   - Checks variable types and references

3. **Planning** (`terraform plan`)
   - Generates execution plan
   - Shows what changes will be made

4. **Formatting** (`terraform fmt`)
   - Standardizes Terraform code formatting

### Testing Approach

This educational project does not include automated tests. Testing is manual:

1. Run `terraform validate` to check syntax
2. Run `terraform plan` to verify configuration logic
3. Run `terraform apply` to deploy infrastructure
4. Verify Azure resources are created correctly via Azure Portal or CLI
5. Test application functionality (VM web servers, load balancers, etc.)
6. Run `terraform destroy` to clean up resources

### CI/CD Integration (Module 32)

Module 32 demonstrates Azure DevOps pipelines for Terraform:

```yaml
# Build Pipeline Tasks
tasks:
- task: TerraformInstaller@0          # Install Terraform CLI
- task: TerraformCLI@0
    command: init                      # Initialize Terraform
- task: TerraformCLI@0
    command: validate                  # Validate configuration
- task: TerraformCLI@0
    command: plan
    commandOptions: -out=tfplan        # Create plan file
- task: TerraformCLI@0
    command: apply
    commandOptions: tfplan             # Apply plan
```

---

## Security Considerations

### Credentials and Secrets

- **SSH Keys**: Stored in `ssh-keys/` directories (ignored by `.gitignore`)
- **SSL Certificates**: Stored in `ssl-self-signed/` directories (ignored)
- **Azure Credentials**: Managed via Azure CLI (`az login`) or environment variables
- **Never commit secrets**: `.gitignore` explicitly excludes `.tfstate` files containing sensitive data

### State File Security

- **`.tfstate` files contain sensitive data**:
  - Resource IDs
  - Connection strings
  - Passwords (if not marked sensitive)
  - Configuration details
- Always use remote backends with encryption for production (Azure Storage with encryption)
- **Never commit `.tfstate` files to version control**

### Network Security

- NSG rules are configured with specific ports and source IP restrictions
- Bastion Host used for secure VM access (avoiding public IPs on VMs)
- Private endpoints and service endpoints used where appropriate (Modules 21, 33)

### Sensitive Variables

Mark sensitive variables to prevent output in logs:
```hcl
variable "db_admin_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
```

---

## .gitignore Rules

The project uses standard Terraform `.gitignore` plus Azure-specific exclusions:

```
# Local .terraform directories
**/.terraform/*

# State files (contain sensitive data)
*.tfstate
*.tfstate.*

# Lock files (ignore or commit based on team preference)
.terraform.lock.hcl

# Crash logs
crash.log

# Override files (local testing)
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# OS files
.DS_Store

# IDE files
.idea/
.ai/

# SSH Keys and certificates
*.pem
*.pub
ssh-keys/
**/ssh-keys/
*.key
ssl-self-signed/*.key
**/ssl-self-signed/*.key
```

---

## Prerequisites

### Required Tools

- **Terraform CLI**: >= 1.5.0 ([Download](https://www.terraform.io/downloads))
- **Azure CLI**: Latest version ([Install](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli))
- **Azure Subscription**: Active Azure subscription with appropriate permissions
- **VS Code**: With Terraform extension (recommended)

### Azure Authentication

Authenticate with Azure before running Terraform:

```bash
# Interactive login
az login

# Verify account
az account show

# List subscriptions
az account list

# Set specific subscription (if multiple)
az account set --subscription "subscription-name-or-id"
```

### Required Permissions

To run the modules, the Azure account needs permissions to create:
- Resource Groups
- Virtual Networks, Subnets, Network Security Groups
- Virtual Machines and related resources
- Public IP addresses
- Load Balancers
- DNS Zones
- Storage Accounts
- Key Vaults (for SSL modules)

---

## Cost Considerations

**Many modules create real Azure resources that incur costs.**

- Always run `terraform destroy` after completing a module
- Some resources are expensive (Application Gateway, Load Balancers, VMs)
- VM Scale Sets with autoscaling can scale unexpectedly
- Use appropriate VM sizes (Standard_DS1_v2 or smaller for learning)
- Consider using Azure DevOps free tier for CI/CD modules

---

## Module Independence

Each module is designed to be **standalone**. You can:

- Work on modules in any order (though sequential is recommended for learning)
- Run modules independently without dependencies on other modules
- Destroy infrastructure from one module without affecting others
- Copy `terraform-manifests/` directories to new locations for experimentation

**Exception**: Modules 24-25 demonstrate remote state dependencies for cross-region deployments.

---

## Useful Functions Demonstrated

- **`file()`**: Read files (SSH public keys, scripts)
- **`filebase64()`**: Read and base64 encode files
- **`base64encode()`**: Base64 encode strings
- **`element()`**: Get element from list by index
- **`lookup()`**: Get value from map with default
- **`path.module`**: Reference current module directory

---

## Notes for AI Agents

### When Making Changes

1. **Respect the learning progression** - Don't introduce advanced concepts in early modules
2. **Follow existing file naming patterns** - Use `c1-`, `c2-`, etc. prefixes
3. **Maintain consistency** - Use same variable names and structure as other modules
4. **Update versions carefully** - Provider version changes may require testing across modules
5. **Preserve educational comments** - Comments are part of the learning experience

### When Adding New Resources

1. Follow the sequential file naming pattern
2. Use appropriate variable naming conventions
3. Include `tags` for Azure resources where supported
4. Add corresponding outputs in `outputs.tf`
5. Update module's README.md with new resource documentation

### File Modification Recommendations

- **Early modules (01-15)**: Keep simple, focus on concepts
- **Middle modules (16-25)**: Introduce meta-arguments and state management
- **Later modules (26-38)**: Complex architectures, DevOps integration, modules
