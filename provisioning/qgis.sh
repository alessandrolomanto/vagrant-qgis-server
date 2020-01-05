#!/bin/bash

# Install QGIS Server with plugin
echo "Installing QGIS Server..."

apt-get update

apt-get install -y qgis-server python-qgis libapache2-mod-fcgid