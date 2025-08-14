#!/bin/bash
# Install AWS CLI for interacting with Cloudflare R2

# Update package list
sudo apt update

# Install AWS CLI
sudo apt install awscli -y

# Verify installation
aws --version

echo "AWS CLI installed successfully."