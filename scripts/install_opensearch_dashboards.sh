#!/bin/bash
# Download and install OpenSearch Dashboards
wget https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/2.11.0/opensearch-dashboards-2.11.0-linux-x64.deb
sudo dpkg -i opensearch-dashboards-2.11.0-linux-x64.deb
rm opensearch-dashboards-2.11.0-linux-x64.deb

# Enable and start OpenSearch Dashboards
sudo systemctl enable opensearch-dashboards
sudo systemctl start opensearch-dashboards

# Verify OpenSearch Dashboards is running
sudo systemctl status opensearch-dashboards