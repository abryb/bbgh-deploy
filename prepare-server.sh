#!/usr/bin/env bash

hostname=$(hostname)
host=http://${hostname}.vps.ovh.net

sudo su
# install docker
apt update
apt install -y  apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt-cache policy docker-ce
apt install -y docker-ce

# docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# bbgh backend
mkdir -p /var/www/bbgh
cd /var/www/bbgh
apt install maven
git clone https://github.com/bpiatek/bbgh-backend backend

# bbgh frontend
cd /var/www/bbgh
git clone https://github.com/bpiatek/bbgh-frontend frontend
echo "VUE_APP_API_HOST=$host" > .env.local

cp -a deploy-bbgh-backend.sh /usr/local/bin
cp -a deploy-bbgh-frontend.sh /usr/local/bin

deploy-bbgh-backend.sh
deploy-bbgh-frontend.sh
