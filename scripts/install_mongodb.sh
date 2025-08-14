#!/bin/bash
# Install MongoDB
sudo apt update
sudo apt install -y mongodb

# Enable and start MongoDB
sudo systemctl enable mongodb
sudo systemctl start mongodb

# Create a database and user
mongo <<EOF
use moassel_db
db.createUser({
  user: "moassel_user",
  pwd: "your_password",
  roles: [{ role: "readWrite", db: "moassel_db" }]
})
EOF

# Enable authentication
sudo sed -i 's/#security:/security:\n  authorization: enabled/' /etc/mongodb.conf

# Restart MongoDB to apply changes
sudo systemctl restart mongodb