#!/bin/sh
#sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum install -y telnet
sudo chmod -R 777 /var/www/html 

# Create a beautiful landing page
cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bastion Host</title>
    <style>
        body {
            font-family: monospace;
            background-color: #2d2d2d;
            color: #00ff00;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .terminal {
            background-color: #000;
            padding: 20px;
            border: 1px solid #333;
            box-shadow: 0 0 10px rgba(0, 255, 0, 0.2);
            max-width: 600px;
        }
    </style>
</head>
<body>
    <div class="terminal">
        <p>> SYSTEM CHECK INITIATED...</p>
        <p>> BASTION HOST: <strong>HOST_NAME</strong></p>
        <p>> STATUS: OPERATIONAL</p>
        <p>> ACCESS GRANTED.</p>
    </div>
</body>
</html>
EOF

# Inject Hostname
sed -i "s/HOST_NAME/$(hostname)/g" /var/www/html/index.html
