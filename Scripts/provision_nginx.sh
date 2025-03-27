#!/bin/bash

# Script to install and configure nginx

# Update

sudo apt update -y

# Upgrade

sudo apt upgrade -y

# Install nginx

sudo apt install nginx -y

# Restart nginx

sudo systemctl restart nginx

# Enable nginx

sudo systemctl enable nginx

echo "Succesfully provisioned nginx"


scp -i ~/.ssh/tech503-jason-aws-key.pem nodejs20-sparta-test-app.zip ubuntu@ec2-3-250-154-131.eu-west-1.compute.amazonaws.com:~