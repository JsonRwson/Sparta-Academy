#!/bin/bash

# Set non-interactive mode to skip interactive prompts (e.g., from needrestart)
export DEBIAN_FRONTEND=noninteractive

# update & upgrade
sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "======== Packages updated and upgraded ========"

# install nginx
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo "======== Nginx installed ========"

# Edit nginx config to configure reverse proxy
sudo sed -i "51c proxy_pass http://127.0.0.1:3000;" /etc/nginx/sites-available/default
echo "======== Nginx configured ========"

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx
echo "======== Nginx restarted and enabled ========"

# get app code - using github
git clone https://github.com/JsonRwson/Sparta-test-app.git
echo "======== App repository cloned ========"

# install nodejs 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo "======== Nodejs installed ========"

# cd into app folder
cd Sparta-test-app/app

# install pm2 - process manager package for nodejs apps
sudo DEBIAN_FRONTEND=noninteractive npm install pm2 -g
echo "======== PM2 installed ========"

# Replace with ip address of DB
# echo 'export DB_HOST=<ip>' >> ~/.bashrc
echo 'export DB_HOST=mongodb://3.250.223.115:27017/posts' >> ~/.bashrc
export DB_HOST=mongodb://54.229.203.9:27017/posts
echo "======== DB_HOST env variable set ========"

# install dependencies
sudo DEBIAN_FRONTEND=noninteractive npm install
echo "======== NPM dependencies installed ========"

# seed the database
echo "======== Seeding database ========"
node seeds/seed.js
echo "======== Seeded database ========"

# kill any running node processes that could interfere
pm2 kill
 
# run the app with pm2
pm2 start app.js

# runs app after instance is restarted
pm2 startup
echo "======== Sparta App deployed with reverse proxy and DB ========"

