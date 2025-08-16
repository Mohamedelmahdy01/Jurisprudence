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
│   ├── configure_ssh.sh
│   └── setup_all.sh
├── .env.example
├── README.md
├── crontab.txt
└── .github
    └── workflows
        └── deploy.yml
```

## Installation

You can run each setup script manually as described below, or run all scripts automatically using `setup_all.sh`:

### Run All Setup Scripts Automatically

```bash
cd scripts
chmod +x setup_all.sh
./setup_all.sh
```

### Manual Steps

1. **Install Node.js**  
   Run `scripts/install_node.sh`

2. **Install PM2**  
   Run `scripts/install_pm2.sh`

3. **Install MongoDB**  
   Run `scripts/install_mongodb.sh`

4. **Install OpenSearch**  
   Run `scripts/install_opensearch.sh`

5. **Install OpenSearch Dashboards**  
   Run `scripts/install_opensearch_dashboards.sh`

6. **Install OpenSearch CLI Tools**  
   Run `scripts/install_opensearch_cli.sh`

7. **Install Nginx**  
   Run `scripts/install_nginx.sh`

8. **Install AWS CLI**  
   Run `scripts/install_awscli.sh`

9. **Configure Nginx**  
   Run `scripts/configure_nginx.sh`

10. **Configure Firewall**  
    Run `scripts/configure_firewall.sh`

11. **Install Certbot**  
    Run `scripts/install_certbot.sh`

12. **Configure SSH**  
    Run `scripts/configure_ssh.sh`

## Backup Procedures

The `backup` directory contains scripts for backing up the Moassel project, MongoDB, and OpenSearch.

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

The `crontab.txt` file contains scheduled tasks for automated backups.  
Example crontab entries:
```
0 2 * * 0 /bin/bash /home/<VPS_USER>/moassel/backup/backup_moassel.sh > /home/<VPS_USER>/moassel/backups/moassel.log 2>&1
0 2 * * 0 /bin/bash /home/<VPS_USER>/moassel/backup/backup_mongodb.sh > /home/<VPS_USER>/moassel/backups/mongodb.log 2>&1
0 2 * * 0 /bin/bash /home/<VPS_USER>/moassel/backup/backup_opensearch.sh > /home/<VPS_USER>/moassel/backups/opensearch.log 2>&1
```
Replace `<VPS_USER>` with your actual VPS username.

To apply the scheduled tasks, run:
```bash
crontab crontab.txt
```

## Deployment Automation

Deployment can be automated using GitHub Actions.  
The workflow will:
- Copy all files to `/home/<VPS_USER>/moassel/` on your VPS.
- Run all setup scripts.
- Set up backup scripts and scheduled tasks.

See `.github/workflows/deploy.yml` for details.

## Conclusion

This README serves as a guide to set up and manage the Moassel project.  
For further assistance, refer to the individual script files for detailed instructions.