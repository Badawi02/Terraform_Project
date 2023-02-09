#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo echo "Hello World from $(hostname -f)" > /var/www/html/index.nginx-debian.html