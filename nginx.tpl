#!/bin/bash
set -e
apt update
apt install -y nginx
ufw allow 'Nginx HTTP'
systemctl enable nginx
systemctl restart nginx
sudo su
echo "Google Compute VM using Terraform" > /var/www/html/index.html
systemctl restart nginx
