#!/bin/bash

echo 'Install apache2 and php'
echo '---------------Install apache2 and php---------------' > install.log
sudo apt update >> install.log
sudo apt -y install apache2 >> install.log
sudo apt -y install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip >> install.log

echo 'Unzip wordpress and set right rights'
echo '---------------Unzip wordpress and set right rights---------------' >> install.log
sudo tar -xvf install_script_bap/wordpress.tar.gz -C /var/www/html >> install.log
sudo chown -R www-data:www-data /var/www/html/wordpress >> install.log
sudo find /var/www/html/wordpress/ -type d -exec chmod 750 {} \; >> install.log
sudo find /var/www/html/wordpress/ -type f -exec chmod 640 {} \; >> install.log

echo 'Change configuration for apache'
echo '---------------Change configuration for apache---------------' >> install.log
sudo rm /etc/apache2/sites-available/000-default.conf >> install.log
sudo mv install_script_bap/000-default.conf /etc/apache2/sites-available/000-default.conf >> install.log

echo 'Check and restart apache'
echo '---------------Check and restart apache2---------------' >> install.log
sudo a2enmod rewrite >> install.log
sudo apache2ctl configtest >> install.log
sudo systemctl restart apache2 >> install.log

echo 'Done'
echo 'Done' >> install.log
