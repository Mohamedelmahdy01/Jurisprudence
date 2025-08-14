#!/bin/bash
# Nginx configuration for Moassel application

# Create a new Nginx configuration file for Moassel
cat <<EOL | sudo tee /etc/nginx/sites-available/moassel.conf
server {
    listen 80;
    server_name your-domain.com www.your-domain.com; # Replace with your domain or server IP

    # Proxy for Moassel Node.js application
    location / {
        proxy_pass http://localhost:3000; # Replace 3000 with your Node.js app port
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }

    # Proxy for OpenSearch Dashboards
    location /dashboards/ {
        proxy_pass http://localhost:5601/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOL

# Enable the new configuration
sudo ln -s /etc/nginx/sites-available/moassel.conf /etc/nginx/sites-enabled/

# Test Nginx configuration
sudo nginx -t

# Restart Nginx to apply changes
sudo systemctl restart nginx

echo "Nginx configured successfully for Moassel application."