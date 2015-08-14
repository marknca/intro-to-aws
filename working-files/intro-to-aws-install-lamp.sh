#! /usr/bin/env bash

# *********************************************************************
# Configure the LAMP stack / Wordpress server for "Intro to AWS"
# *********************************************************************

# install the needed software
sudo yum -y update
sudo yum -y install httpd php mysql-server mysql php-mysql
sudo service httpd start
sudo service mysqld start

# configure MySQL
sudo mysql < intro-to-aws-mysql-setup.sql

# configure Wordpress
cd ~/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv intro-to-aws-wp-config.php wordpress/wp-config.php
cd wordpress
sudo mv * /var/www/html/
sudo chown -R apache /var/www
sudo chgrp -R apache /var/www
sudo chkconfig httpd on
sudo chkconfig mysqld on

# restart Apache
sudo service httpd restart