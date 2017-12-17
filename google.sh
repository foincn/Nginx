# !/bin/bash

sudo apt-get -y update
sudo apt-get -y install nginx
sudo apt-get -y install letsencrypt
sudo apt-get -y install python3-pip
sudo pip3 install setuptools
sudo pip3 install letsencrypt-nginx

sudo cp -rf /google.conf /etc/nginx/conf.d/google.conf

letsencrypt --nginx -d --email v@omg.tf
