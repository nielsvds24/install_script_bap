#!/bin/bash

sudo apt update
sudo apt -y install apache2
sudo apt -y install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
sudo tar -xvf install_script_bap/latest.tar.gz -C /var/www/html
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo find /var/www/html/wordpress/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/wordpress/ -type f -exec chmod 640 {} \;
sudo rm /etc/apache2/sites-available/000-default.conf
sudo mv install_script_bap/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo a2enmod rewrite
sudo apache2ctl configtest
sudo systemctl restart apache2

