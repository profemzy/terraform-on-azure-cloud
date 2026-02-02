#!/bin/sh
#sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html 
sudo mkdir /var/www/html/webvm

# Create a beautiful landing page
cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WebVM - Stack Simplify</title>
    <style>
        :root {
            --primary-color: #6f42c1;
            --secondary-color: #5a32a3;
            --bg-color: #f3f0ff;
            --text-color: #333;
            --card-bg: #ffffff;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: var(--card-bg);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(111, 66, 193, 0.15);
            text-align: center;
            max-width: 600px;
            width: 90%;
            transition: transform 0.3s ease;
        }
        .container:hover {
            transform: translateY(-5px);
        }
        h1 {
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 2.5rem;
        }
        p {
            font-size: 1.1rem;
            line-height: 1.6;
            color: #666;
        }
        .highlight {
            color: var(--secondary-color);
            font-weight: bold;
        }
        .status-badge {
            display: inline-block;
            padding: 8px 16px;
            background-color: #eee5ff;
            color: #6f42c1;
            border-radius: 20px;
            font-weight: 600;
            margin-top: 20px;
        }
        .metadata {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            font-size: 0.9rem;
            color: #999;
        }
        .footer {
            margin-top: 40px;
            font-size: 0.8rem;
            color: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>WebVM Portal</h1>
        <div class="status-badge">Gateway Online</div>
        <p>Welcome to the <strong>Stack Simplify</strong> Web Tier.</p>
        <p>This request is being served by Virtual Machine:</p>
        <h2 class="highlight">HOST_NAME</h2>
        
        <div class="metadata">
            <p>Environment: Terraform on Azure</p>
            <p>Application Version: V1</p>
        </div>
        
        <div class="footer">
            &copy; 2026 InfoTitans. All rights reserved.
        </div>
    </div>
</body>
</html>
EOF

# Inject Hostname
sed -i "s/HOST_NAME/$(hostname)/g" /var/www/html/index.html

# Create other pages
echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/webvm/hostname.html
echo "Welcome to stacksimplify - WebVM App1 - App Status Page" > /var/www/html/webvm/status.html
cp /var/www/html/index.html /var/www/html/webvm/index.html

# Metadata
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/webvm/metadata.html

# Azure CLI and Blob Download
sudo sh -c 'echo -e "[azure-cli] 
name=Azure CLI 
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
sudo yum install -y azure-cli
sudo cd /etc/httpd/conf.d
sudo az storage blob download -c ${httpd_files_container_name} -f /etc/httpd/conf.d/app1.conf -n app1.conf --account-name ${storage_account_name} --account-key ${storage_account_key}
sudo systemctl reload httpd
/usr/sbin/setsebool -P httpd_can_network_connect 1 
