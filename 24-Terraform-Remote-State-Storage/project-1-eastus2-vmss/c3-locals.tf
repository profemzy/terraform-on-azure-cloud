# Define Local Values in Terraform
locals {
  owners      = var.business_divsion
  environment = var.environment
  resource_name_prefix = "${var.resource_group_location}-${var.business_divsion}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
    Tag         = "demo-tag1" # Uncomment during step-08   
    Tag         = "demo-tag2"
    Tag         = "demo-tag3"
    Tag         = "demo-tag4"
  }

  webvm_custom_data = templatefile("${path.module}/app-scripts/webvm-init.sh", {})
}
