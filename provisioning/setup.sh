#!/bin/bash
set -e

export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

chmod +x /vagrant/provisioning/apache2.sh /vagrant/provisioning/qgis.sh /vagrant/provisioning/conf.sh

# Provisioning scripts
echo "Runnig provisioning scripts ..."

/vagrant/provisioning/apache2.sh
/vagrant/provisioning/qgis.sh
/vagrant/provisioning/conf.sh

# Clean
echo "Cleaning up ..."
apt-get autoremove -y
apt-get clean

echo "All done!"