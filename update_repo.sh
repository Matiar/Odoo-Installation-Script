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

OE_VERSION="10.0"

#--------------------------------------------------
# Get Pull From CCA Repo
#--------------------------------------------------

echo -e "\n---- Start Updating OCA Repo ----"

echo -e "\n---- Start Updating SERVER-TOOLS Repo ----"
cd "server-tools"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating WEB Repo ----"
cd "web"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating WEBSITE Repo ----"
cd "website"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating WEBSITE-ADDONS Repo ----"
cd "website-addons"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating reporting-engine Repo ----"
cd "reporting-engine"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating operating-unit Repo ----"
cd "operating-unit"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating odoo-community-addons Repo ----"
cd "odoo-community-addons"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating HR Repo ----"
cd "hr"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating partner-contact Repo ----"
cd "partner-contact"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating product-attribute Repo ----"
cd "product-attribute"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating account-financial-tools Repo ----"
cd "account-financial-tools"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating account-financial-reporting Repo ----"
cd "account-financial-reporting"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating account-invoicing Repo ----"
cd "account-invoicing"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating account-analytic Repo ----"
cd "account-analytic"
sudo git pull origin $OE_VERSION
cd ../

echo -e "\n---- Start Updating account-payment Repo ----"
cd "account-payment"
sudo git pull origin $OE_VERSION
cd ../

#echo -e "\n---- Start Updating gbs-account Repo ----"
#cd "gbs-account"
#sudo git pull origin $OE_VERSION
#cd ../

#echo -e "\n---- Start Updating odoo-addons Repo ----"
#cd "odoo-addons"
#sudo git pull origin $OE_VERSION
#cd ../

echo "-----------------------------------------------------------"web
echo "Done! "
echo "-----------------------------------------------------------"
