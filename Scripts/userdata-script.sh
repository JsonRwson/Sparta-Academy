#!/bin/bash

# Wait to ensure directories and packages are available
sleep 10

# Set the ip for the Database as an environment variable
echo 'export DB_HOST=mongodb://54.195.144.211:27017/posts' >> home ubuntu/.bashrc
export DB_HOST=mongodb://54.195.144.211:27017/posts

# Switch user to default instead of root
sudo su ubuntu

# Switch to the directory the app is in
cd /home/ubuntu/Sparta-test-app/app

sudo npm install

# Seed the database
node seeds/seed.js

# Start the app
pm2 start app.js
pm2 startup

