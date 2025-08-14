#!/bin/bash
# Install PM2 globally
sudo npm install -g pm2

# Set up PM2 to start automatically on system boot
pm2 startup

# Run the command output by the above step to enable PM2 on boot
echo "Run the command output by the above step to enable PM2 on boot."