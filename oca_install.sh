#!/bin/bash
################################################################################
# Script for installing Odoo V10 on Ubuntu 16.04, 15.04, 14.04 (could be used for other version too)
# Author: Yenthe Van Ginneken
#-------------------------------------------------------------------------------
# This script will install Odoo on your Ubuntu 14.04 server. It can install multiple Odoo instances
# in one Ubuntu because of the different xmlrpc_ports
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano odoo-install.sh
# Place this content in it and then make the file executable:
# sudo chmod +x odoo-install.sh
# Execute the script to install Odoo:
# ./odoo-install
################################################################################
 
##fixed parameters
#odoo
OE_USER="odoo"
OE_HOME="/$OE_USER"
OE_HOME_EXT="/$OE_USER/${OE_USER}-server"
#The default port where this Odoo instance will run under (provided you use the command -c in the terminal)
#Set to true if you want to install it, false if you don't need it or have it already installed.
INSTALL_WKHTMLTOPDF="True"
#Set the default Odoo port (you still have to use -c /etc/odoo-server.conf for example to use this.)
OE_PORT="8069"
#Choose the Odoo version which you want to install. For example: 10.0, 9.0, 8.0, 7.0 or saas-6. When using 'trunk' the master version will be installed.
#IMPORTANT! This script contains extra libraries that are specifically needed for Odoo 10.0
OE_VERSION="10.0"
# Set this to True if you want to install Odoo 10 Enterprise!
IS_ENTERPRISE="False"
#set the superadmin password
OE_SUPERADMIN="admin"
OE_CONFIG="${OE_USER}-server"
OE_OCA_HOME="$OE_HOME/custom"


#--------------------------------------------------
# Install Dependencies
#--------------------------------------------------

echo -e "\n---- Create custom module directory ----"
sudo su $OE_USER -c "mkdir $OE_HOME/custom"

echo -e "\n==== Downloan OCA Repository and Install Dependencies ===="
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/web.git $OE_OCA_HOME/web/

sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-tools.git $OE_OCA_HOME/server-tools/
sudo pip install -r $OE_OCA_HOME/server-tools/requirements.txt

sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/operating-unit.git $OE_OCA_HOME/operating-unit/
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/reporting-engine.git $OE_OCA_HOME/reporting-engine/
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/crm.git $OE_OCA_HOME/crm/
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/hr.git $OE_OCA_HOME/hr/
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/partner-contact.git $OE_OCA_HOME/partner-contact/

sudo git clone --depth 1 --branch $OE_VERSION https://github.com/modoolar/project_agile.git $OE_OCA_HOME/project_agile/
sudo pip install -r $OE_OCA_HOME/project_agile/requirements.txt

sudo git clone --depth 1 --branch $OE_VERSION https://github.com/genweb2/gbs.git $OE_OCA_HOME/addons/

echo -e "\n---- Setting permissions on home folder ----"
sudo chown -R $OE_USER:$OE_USER $OE_HOME/*

sudo su root -c "echo 'addons_path=$OE_OCA_HOME/web,$OE_OCA_HOME/server-tools,$OE_OCA_HOME/operating-unit,$OE_OCA_HOME/project_agile,$OE_OCA_HOME/addons' >> /etc/${OE_CONFIG}.conf"


echo "-----------------------------------------------------------"
echo "Done! "
echo "-----------------------------------------------------------"
