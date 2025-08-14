# Moassel Project

This README provides an overview of the Moassel project, including installation instructions, configuration details, and backup procedures.

## Project Structure

```
Moassel
├── backup
│   ├── backup_moassel.sh
│   ├── backup_mongodb.sh
│   └── backup_opensearch.sh
├── scripts
│   ├── install_node.sh
│   ├── install_pm2.sh
│   ├── install_mongodb.sh
│   ├── install_opensearch.sh
│   ├── install_opensearch_dashboards.sh
│   ├── install_opensearch_cli.sh
│   ├── install_nginx.sh
│   ├── install_awscli.sh
│   ├── configure_nginx.sh
│   ├── configure_firewall.sh
│   ├── install_certbot.sh
│   └── configure_ssh.sh
├── .env.example
├── README.md
└── crontab.txt
```

## Installation

Follow the scripts in the `scripts` directory to set up the necessary components for the Moassel application.

### 1. Install Node.js
Run the `install_node.sh` script to install Node.js.

### 2. Install PM2
Run the `install_pm2.sh` script to install PM2 for managing the Node.js application.

### 3. Install MongoDB
Run the `install_mongodb.sh` script to install and configure MongoDB.

### 4. Install OpenSearch
Run the `install_opensearch.sh` script to install OpenSearch.

### 5. Install OpenSearch Dashboards
Run the `install_opensearch_dashboards.sh` script to install OpenSearch Dashboards.

### 6. Install OpenSearch CLI Tools
Run the `install_opensearch_cli.sh` script to install the OpenSearch CLI tools.

### 7. Install Nginx
Run the `install_nginx.sh` script to install Nginx as a reverse proxy.

### 8. Install AWS CLI
Run the `install_awscli.sh` script to install the AWS CLI for interacting with Cloudflare R2.

### 9. Configure Nginx
Run the `configure_nginx.sh` script to set up Nginx for the Moassel application and OpenSearch Dashboards.

### 10. Configure Firewall
Run the `configure_firewall.sh` script to allow necessary ports through the firewall.

### 11. Install Certbot
Run the `install_certbot.sh` script to install Certbot for managing SSL certificates.

### 12. Configure SSH
Run the `configure_ssh.sh` script to enhance SSH security settings.

## Backup Procedures

The `backup` directory contains scripts for backing up the Moassel project, MongoDB, and OpenSearch.

### 1. Backup Moassel Project
Run the `backup_moassel.sh` script to back up the Moassel project directory, compress it, upload it to Cloudflare R2, and remove the local backup.

### 2. Backup MongoDB
Run the `backup_mongodb.sh` script to back up the MongoDB database, export it, compress the export, upload it to Cloudflare R2, and remove the local backup.

### 3. Backup OpenSearch
Run the `backup_opensearch.sh` script to create a snapshot of the OpenSearch data and upload it to Cloudflare R2.

## Environment Variables

Refer to the `.env.example` file for the required environment variables for the application.

## Scheduled Backups

The `crontab.txt` file contains scheduled tasks for automated backups. You can set up these tasks using the `crontab` command.

## Conclusion

This README serves as a guide to set up and manage the Moassel project. For further assistance, refer to the individual script files for detailed instructions.