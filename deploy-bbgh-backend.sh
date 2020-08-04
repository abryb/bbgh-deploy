#!/usr/bin/env bash

cd /var/www/bbgh/backend
git pull origin master
mvn install
docker-compose up --build -d
