#!/bin/bash

# install lnmp
apt -y install nginx mariadb-server zip
apt -y install php7.4-fpm php7.4-mysql php7.4-curl php7.4-bcmath php7.4-mbstring php7.4-xml php7.4-zip

# install npm dependencies
apt -y install nodejs npm

# install deploy dependencies
apt -y install acl

# install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# make deployer user
adduser deployer
echo 'deployer ALL=(ALL) NOPASSWD: ALL' | tee -a /etc/sudoers.d/deployer

# create database
# mysql < pre.sql
