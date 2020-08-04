#!/usr/bin/env bash

cd /var/www/bbgh/frontend
git pull origin master
APP_PORT=80 docker-compose -f docker-compose.prod.yaml up --build -d
