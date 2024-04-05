#!/bin/bash

dbUser="root"   # DB_USERNAME
dbPass=""       # DB_PASSWORD
dbName="open_fintech"

# Change to project directory.
cd /var/www/html

# Create the files directory if it does not exist.
mkdir -p web/sites/default/files

# Run composer nuke to delete all artifacts and install afresh.
COMPOSER_ALLOW_SUPERUSER=1 COMPOSER_ROOT_VERSION=dev-master composer nuke

# Create DB if not there.
if ! mysql -u $dbUser -p$dbPass -e "use $dbName";
then
  # Create the database.
  mysql -u $dbUser -p$dbPass -e "CREATE DATABASE $dbName;"
  # Create an user to access from the web server and give it appropriate privileges.
  mysql -u $dbUser -p$dbPass -e "CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'db_admin';"
  mysql -u $dbUser -p$dbPass -e "GRANT ALL PRIVILEGES on *.* to 'db_admin'@'localhost'"
  # Change ownership of writable components for web server.
  chown www-data:www-data -R web
  # Change permission of files and settings.php
  chmod a+w web/sites/default
else
  # We assume if db is present then Drupal is already installed.
  # If so run drush deploy.
  vendor/bin/drush deploy
fi
