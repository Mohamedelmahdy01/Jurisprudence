#!/bin/bash
# Configure the firewall to allow necessary ports

# Allow HTTP and HTTPS traffic
sudo ufw allow 80
sudo ufw allow 443

# Allow MongoDB (optional, only if accessed externally)
sudo ufw allow 27017

# Allow OpenSearch (optional, only if accessed externally)
sudo ufw allow 9200

# Allow OpenSearch Dashboards (optional, only if accessed externally)
sudo ufw allow 5601

# Enable the firewall
sudo ufw enable

# Show the status of the firewall
sudo ufw status verbose