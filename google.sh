# !/bin/bash

sudo apt-get -y update
sudo apt-get -y install nginx

sudo cp -rf /google.conf /etc/nginx/conf.d/google.conf
