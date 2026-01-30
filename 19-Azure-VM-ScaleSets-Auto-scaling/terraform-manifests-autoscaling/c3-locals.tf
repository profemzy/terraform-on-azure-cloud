# Define Local Values in Terraform
locals {
  owners               = var.business_divsion
  environment          = var.environment
  resource_name_prefix = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
  webvm_custom_data = <<CUSTOM_DATA
      #!/bin/sh
      #sudo yum update -y
      sudo yum install -y httpd
      sudo systemctl enable httpd
      sudo systemctl start httpd
      sudo systemctl stop firewalld
      sudo systemctl disable firewalld
      sudo chmod -R 777 /var/www/html
      sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html
      sudo mkdir /var/www/html/app1
      sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/app1/hostname.html
      sudo echo "Welcome to stacksimplify - WebVM App1 - App Status Page" > /var/www/html/app1/status.html
      sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - WebVM APP-1 </h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
      sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html
    CUSTOM_DATA

  bastion_host_custom_data = <<CUSTOM_DATA
      #!/bin/sh
      #sudo yum update -y
      sudo yum install -y httpd
      sudo systemctl enable httpd
      sudo systemctl start httpd
      sudo systemctl stop firewalld
      sudo systemctl disable firewalld
      sudo yum install -y telnet
      sudo chmod -R 777 /var/www/html
      sudo echo "Welcome to stacksimplify - Bastion Host - VM Hostname: $(hostname)" > /var/www/html/index.html
    CUSTOM_DATA
}