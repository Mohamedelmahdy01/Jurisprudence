# Moassel Project

This README provides an overview of the Moassel project, including installation instructions, configuration details, and backup procedures.

## Project Structure

```
Moassel
├── ansible
│   ├── inventory.ini
│   ├── site.yml
│   └── roles
│       ├── nodejs
│       ├── pm2
│       ├── mongodb
│       ├── opensearch
│       ├── opensearch_dashboards
│       ├── opensearch_cli
│       ├── nginx
│       ├── awscli
│       ├── certbot
│       ├── firewall
│       ├── ssh
│       └── backup
├── backup
│   ├── backup_moassel.sh
│   ├── backup_mongodb.sh
│   └── backup_opensearch.sh
├── .env.example
├── README.md
├── crontab.txt
└── .github
    └── workflows
        └── deploy.yml
```

## Installation & Provisioning

All provisioning and setup is now handled by Ansible. You do not need to run any scripts manually.

### Run All Setup Tasks Automatically

```bash
ansible-playbook -i ansible/inventory.ini ansible/site.yml
```

This will:
- Install all required packages and services (Node.js, PM2, MongoDB, OpenSearch, Nginx, Certbot, AWS CLI, etc.)
- Configure Nginx, firewall, SSH, and all other system settings
- Set up backup scripts and scheduled tasks

## Backup Procedures

The `backup` directory contains scripts for backing up the Moassel project, MongoDB, and OpenSearch. These can be run manually if needed, but are also scheduled via Ansible.

- **Backup Moassel Project:**  
  Run `backup/backup_moassel.sh` to back up the Moassel project directory, compress it, upload it to Cloudflare R2, and remove the local backup.

- **Backup MongoDB:**  
  Run `backup/backup_mongodb.sh` to back up the MongoDB database, compress the export, upload it to Cloudflare R2, and remove the local backup.

- **Backup OpenSearch:**  
  Run `backup/backup_opensearch.sh` to create a snapshot of the OpenSearch data and upload it to Cloudflare R2.

## Environment Variables

Refer to the `.env.example` file for the required environment variables for the application.  
**Do not commit your real `.env` file to version control.**

## Scheduled Backups

The `crontab.txt` file contains scheduled tasks for automated backups. These are installed automatically by Ansible.

## Deployment Automation

Deployment and provisioning are fully automated using Ansible. See `ansible/site.yml` for details.

## Conclusion

This README serves as a guide to set up and manage the Moassel project.  
For further assistance, refer to the Ansible roles and playbooks for detailed instructions.