#!/bin/bash
# Install prerequisites (Java is required for OpenSearch)
sudo apt update
sudo apt install -y openjdk-11-jdk

# Download and install OpenSearch
wget https://artifacts.opensearch.org/releases/bundle/opensearch/2.11.0/opensearch-2.11.0-linux-x64.deb
sudo dpkg -i opensearch-2.11.0-linux-x64.deb
rm opensearch-2.11.0-linux-x64.deb

# Enable and start OpenSearch
sudo systemctl enable opensearch
sudo systemctl start opensearch

# Verify OpenSearch is running
sudo systemctl status opensearch