#!/bin/bash
set -e

apt-get update
apt-get upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -aG docker ubuntu

mkdir -p /home/ubuntu/app
cd /home/ubuntu/app

# Clone repository (REPLACE WITH YOUR GITHUB USERNAME)
git clone https://github.com/YOUR_USERNAME/fusionpact-devops-gauntlet.git .

cat > .env << EOF
DATABASE_URL=sqlite:///./data/app.db
GRAFANA_PASSWORD=admin123
EOF

docker-compose up -d

chown -R ubuntu:ubuntu /home/ubuntu/app