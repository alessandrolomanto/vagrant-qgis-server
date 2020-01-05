#!/bin/bash
#Enable the fcgid mod
echo "Enable the fcgid mod..."
a2enmod fcgid
a2enconf serve-cgi-bin

# Enable Apache Mods
echo "Enable Apache Mods..."
a2enmod rewrite

# Copy configuration file from local to server
echo "Copy configuration file..."
cp /vagrant/conf/000-default.conf /etc/apache2/sites-available/000-default.conf

# Restart the apache2 service
echo "Restart the apache2 service..."
service apache2 restart
