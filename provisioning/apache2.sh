#!/bin/bash
# Provisioning file for Apache

# Update Packages
apt-get update

# Apache
echo "Installing apache..."
apt-get install -y apache2