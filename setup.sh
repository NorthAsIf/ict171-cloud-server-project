#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y
sudo ufw allow 'Apache Full'
echo "Apache2 installed and firewall configured"
