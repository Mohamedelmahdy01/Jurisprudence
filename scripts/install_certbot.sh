#!/bin/bash
# Install Certbot for SSL certificate management

# Update package list
sudo apt update

# Install Certbot and the Nginx plugin
sudo apt install certbot python3-certbot-nginx -y

# Obtain an SSL certificate (replace your-domain.com with your actual domain)
sudo certbot --nginx -d your-domain.com -d www.your-domain.com

# Set up automatic renewal for the SSL certificate
sudo systemctl enable certbot.timer
sudo systemctl start certbot.timer

echo "Certbot installation and configuration completed successfully."