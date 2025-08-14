#!/bin/bash
# Install OpenSearch CLI tools

# Update package list
sudo apt update

# Install OpenSearch CLI
sudo npm install -g @opensearch-project/opensearch-cli

echo "OpenSearch CLI tools installed successfully."