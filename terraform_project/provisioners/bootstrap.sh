#!/bin/bash
# simple example to install nginx and create index.html
sudo yum update -y || sudo apt-get update -y
# install nginx for Amazon Linux / Debian fallback
if command -v yum >/dev/null 2>&1; then
  sudo yum install -y nginx
else
  sudo apt-get install -y nginx
fi
sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>Hello from Terraform provisioner</h1>" | sudo tee /usr/share/nginx/html/index.html
