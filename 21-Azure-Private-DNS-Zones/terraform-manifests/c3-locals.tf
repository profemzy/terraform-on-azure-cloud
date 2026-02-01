# Define Local Values in Terraform
locals {
  owners               = var.business_divsion
  environment          = var.environment
  resource_name_prefix = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }

  bastion_host_custom_data = templatefile("${path.module}/app-scripts/bastion-init.sh", {})

  webvm_custom_data = templatefile("${path.module}/app-scripts/webvm-init.sh", {
    httpd_files_container_name = azurerm_storage_container.httpd_files_container.name
    storage_account_name       = azurerm_storage_account.storage_account.name
    storage_account_key        = azurerm_storage_account.storage_account.primary_access_key
  })

  appvm_custom_data = templatefile("${path.module}/app-scripts/appvm-init.sh", {})
} 
