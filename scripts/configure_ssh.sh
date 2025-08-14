#!/bin/bash
# Configure SSH settings for better security

# Change the default SSH port
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

# Disable root login via SSH
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# Allow only specific users to connect via SSH
echo "AllowUsers your_username" | sudo tee -a /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart sshd

echo "SSH configuration updated for better security."