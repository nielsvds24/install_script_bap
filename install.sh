#!/bin/bash

sudo apt update
sudo apt install apache2
sudo apt install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
sudo systemctl restart apache2
sudo curl -o /var/www/html https://wordpress.org/latest.tar.gz
sudo tar -xvf /var/www/html/latest.tar.gz
sudo rm /var/www/html/latest.tar.gz
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo find /var/www/html/wordpress/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/wordpress/ -type f -exec chmod 640 {} \;
sudo mv install_script_bap/wp-config.php /var/www/html/wordpress/wp-config.php

