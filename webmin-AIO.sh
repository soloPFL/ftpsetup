#AIO Webmin Setup Script

#!/bin/bash

# Update the package index
sudo apt-get update

# Download and make the setup-repos.sh script executable
curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
sudo chmod +x setup-repos.sh

# Run the setup-repos.sh script
sudo ./setup-repos.sh

# Install Webmin
sudo apt-get install webmin
