#!/bin/bash

# Set non-interactive mode to skip interactive prompts (e.g., from needrestart)
export DEBIAN_FRONTEND=noninteractive

# update
sudo apt update -y

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx

# get app code - using github
git clone https://github.com/JsonRwson/Sparta-test-app.git

# install nodejs 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# check app version
node -v

# cd into app folder
cd Sparta-test-app/app

# install dependencies
sudo npm install

# start the app in the background
nohup npm start app.js &
bg