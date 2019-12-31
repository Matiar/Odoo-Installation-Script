#If Apache web server is running, stop it:
systemctl stop apache2
#and remove it from your VPS:
apt-get purge apache2*
apt autoremove
#Now, run the following command to install Nginx:
apt-get install nginx
#start the web server and enable it to start on boot:
systemctl start nginx
systemctl enable nginx
#check if Nginx is successfully started using the following command:
systemctl status nginx
