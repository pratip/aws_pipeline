#!/bin/bash

# Install apache and related.
apt update -y
apt install -y php8.1 apache2 mysql-server php-xml php-gd php8.1-mysql

# Enable mod_rewrite for apache2
a2enmod rewrite
sed -i '172s/None/All/' /etc/apache2/apache2.conf

# Set webroot to Drupal webroot
sed -i '12s/.*/DocumentRoot \/var\/www\/html\/web/' /etc/apache2/sites-available/000-default.conf

# Install curl and composer
apt install curl php-curl
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer self-update
