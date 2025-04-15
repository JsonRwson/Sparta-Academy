# Server Environment Automation

**This document details the processes automated by two Bash scripts.**

1. Deploying a Node.js application with an Nginx reverse proxy
2. Setting up a MongoDB database server.

**Ensure that:**

* The database script is ran first, this is so you can supply the ip address of the database to the app deployment script
* Each script is run on a different virtual instance
* The database instance is configured to accept requests on port `27017`
* The app instance is configured to accept HTTP requests on port `80`

## App Deployment with Reverse Proxy

This script deploys a Node.js web application, configures Nginx as a reverse proxy, and sets up the environment to connect to a MongoDB database.

### 1. System Update and Package Upgrade

The script begins by setting the environment to non-interactive mode and updating the system:

```bash
export DEBIAN_FRONTEND=noninteractive

sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
```

* This ensures that any screens that require user input, that may cause the script to hang are skipped
* This also ensures that all packages on the instance are up-to-date

### 2. Installing and Configuring Nginx

Nginx is installed and its configuration is modified to forward requests to the Node.js application:

```bash
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y

# Edit the Nginx configuration to set up reverse proxy on line 51
sudo sed -i "51c proxy_pass http://127.0.0.1:3000;" /etc/nginx/sites-available/default

# Restart and enable Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx
```

* Nginx will now forward any HTTP request the web server recieves to the port that the app will run on: `3000`
* The `enable` command ensures nginx now launches on startup

### 3. Cloning the Application Repository

The application code is retrieved from a GitHub repository:

```bash
git clone https://github.com/JsonRwson/Sparta-test-app.git
```

### 4. Installing Node.js and PM2

The script installs Node.js (version 20.x) and PM2 (a process manager for Node.js):

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# Change directory into the application folder
cd Sparta-test-app/app

# Install PM2 globally
sudo DEBIAN_FRONTEND=noninteractive npm install pm2 -g
```

### 5. Configuring the Environment and Dependencies

The database host is set as an environment variable, and application dependencies are installed:

```bash
# Set the DB_HOST environment variable
echo 'export DB_HOST=mongodb://3.250.223.115:27017/posts' >> ~/.bashrc
export DB_HOST=mongodb://3.250.223.115:27017/posts

# Install the application's NPM dependencies
sudo DEBIAN_FRONTEND=noninteractive npm install

# Seed the database with initial data
node seeds/seed.js
```

* This ensures the node application can access the database, as we specify the ip in an environment variable

### 6. Running the Application with PM2

Any conflicting processes are terminated, and the application is started under PM2 management:

```bash
# Kill any running Node.js processes that might interfere
pm2 kill

# Start the application with PM2
pm2 start app.js

# Configure PM2 to start the application on system reboot
pm2 startup
```

---

## MongoDB Database Setup

This script installs MongoDB, configures it to accept remote connections, and starts the MongoDB service.

### 1. System Update and Package Upgrade

The script begins by setting the environment to non-interactive mode and updating the system:

```bash
export DEBIAN_FRONTEND=noninteractive

sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
```

* This ensures any interactive screens that would cause the script to hang are skipped

### 2. Installing Required Utilities

Essential tools `gnupg` and `curl` are installed:

```bash
sudo DEBIAN_FRONTEND=noninteractive apt install gnupg curl
```

* GNUPG is a free, open-source cryptographic software suite that provides digital encryption and signing services
* Curl is a command-line HTTP client

### 3. Adding the MongoDB Repository and Installing Components

The MongoDB GPG key is added, and the repository is configured:

```bash
# Fetch and add the MongoDB GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

# Add the MongoDB repository to APT sources
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update package list and install MongoDB components
sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6
```

### 4. Configuring MongoDB for Remote Connections

To allow remote access, MongoDB’s configuration is updated:

```bash
# Change the bindIp setting to allow connections from any IP address
sudo sed -i '21s/.*/  bindIp: 0.0.0.0/' /etc/mongod.conf
```

This command uses `sed`, a stream editor utility:

* The -i flag means edit the file "in-place", meaning changes are directly applied
* `21s/.../.../` 21 specifies to operate on line 21 of the file, s stands for substute or "replace text"
* `.*` - `.` matches any character - `*` matches zero or more occurances
* Therefore the entire line is replaced with `bindIp: 0.0.0.0`

### 5. Starting the MongoDB Service

Finally, the MongoDB service is started:

```bash
sudo systemctl start mongod
```
