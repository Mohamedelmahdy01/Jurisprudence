# Moassel Project

This README provides an overview of the Moassel project, including installation instructions, configuration details, and backup procedures.

## Project Structure

```
Moassel/
├── ansible/         # Infrastructure as code (playbooks, roles, variables)
├── backup/          # Backup scripts (automated by Ansible)
├── crontab.txt      # Cron jobs (managed by Ansible)
├── .env.example     # Example environment variables
├── README.md        # Project documentation
└── .github/         # CI/CD workflows
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


All backup and restore operations are fully automated via Ansible roles. Manual scripts are kept for reference or emergency use only.

- **Backup Moassel Project:**
  - Automated: Managed by Ansible backup role and scheduled tasks.
  - Manual: You can run `backup/backup_moassel.sh` if needed.

- **Backup MongoDB:**
  - Automated: Managed by Ansible backup role and scheduled tasks.
  - Manual: You can run `backup/backup_mongodb.sh` if needed.

- **Backup OpenSearch:**
  - Automated: Managed by Ansible backup role and scheduled tasks.
  - Manual: You can run `backup/backup_opensearch.sh` if needed.


## Configuration & Variables

All service and infrastructure configuration is managed via Ansible variables in `ansible/group_vars/all.yml`.

- Sensitive data (passwords, secrets) should be protected using Ansible Vault. See [Ansible Vault documentation](https://docs.ansible.com/ansible/latest/user_guide/vault.html).
- Do not commit real secrets or production credentials to version control.

Refer to the `.env.example` file for application-level environment variables only.


## Scheduled Backups & Automation

All backup schedules and cron jobs are managed by Ansible. See `ansible/roles/backup` and `crontab.txt` for details. No manual cron setup is required.


## Deployment & Provisioning

Deployment, provisioning, and all service setup are fully automated using Ansible. See `ansible/site.yml` and the roles in `ansible/roles/` for details.


## Ansible Roles Overview

Each major service is managed by a dedicated Ansible role:

- `nodejs`, `pm2`: Application runtime and process management
- `mongodb`: Database installation, configuration, and user setup
- `opensearch`, `opensearch_dashboards`, `opensearch_cli`: Search and analytics stack
- `nginx`: Web server and reverse proxy
- `awscli`: AWS CLI tools for backup/restore
- `certbot`: SSL certificate automation
- `firewall`: Security and port management
- `ssh`: SSH hardening and access control
- `backup`: Automated backup and restore tasks

All configuration is dynamic and controlled via variables in `group_vars/all.yml`.

---

For further assistance, see the Ansible playbooks and roles, or contact the project maintainer.