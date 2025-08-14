#!/bin/bash
# Install Nginx as a reverse proxy

# Update package list
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Check Nginx status
sudo systemctl status nginx

echo "Nginx installation completed successfully."