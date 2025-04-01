#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# update & upgrade
sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "======== Packages updated and upgraded ========"

# install gnupg and curl
sudo DEBIAN_FRONTEND=noninteractive apt install gnupg curl
echo "======== gnup & curl installed ========"

# use curl to fetch the MongoDB GPG key
# -f: Fail silently on server errors
# -s: Silent mode (no progress meter or error messages)
# -S: Show errors (used with -s to show errors if they occur)
# -L: Follow redirects

# Pipe the downloaded key into the gpg command
# This command converts the key into a suitable format for use with APT
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "======== Added MongoDB GPG key  ========"

# Adding MongoDB to the system's repository sources
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Refreshing the package list, so that MongoDB will be added
sudo apt update -y

# Then installing MongoDB components targeting version 7.0.6
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6
echo "======== Installed MongoDB components  ========"

# Change the MongoDB config to allow connections from any ip address
# -i: Edits the file in place
# s/^bindIp:.*/bindIp: 0.0.0.0/: Searches for lines starting with bindIp:
# replaces the entire line with bindIp: 0.0.0.0.
sudo sed -i '21s/.*/  bindIp: 0.0.0.0/' /etc/mongod.conf
echo "======== Altered MongoDB config to allow connections from any ip  ========"

# Start the database service
sudo systemctl start mongod
sudo systemctl enable mongod
echo "======== MongoDB service provisioned  ========"