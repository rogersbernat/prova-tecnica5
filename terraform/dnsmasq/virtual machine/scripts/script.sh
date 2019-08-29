#!/usr/bin/env bash

sudo apt-get install dnsmasq dnsutils -y 

echo "network test"
-----------------------------------

ping -c5 emnify.com

nslookup ns=emnify.com

cat /etc/resolv.conf

sudo mv /home/ubuntu/dnsmasq.conf  /etc/dnsmasq.d/dnsmasq.conf
sudo mv /home/ubuntu/resolv.dnsmasq  /etc/resolv.dnsmasq

sudo chown root: /etc/dnsmasq.d/dnsmasq.conf
sudo chown root: /etc/resolv.dnsmasq

ls -las /etc/dnsmasq.d
cat /etc/dnsmasq.d/*

sudo systemctl stop systemd-resolved

sudo /etc/init.d/dnsmasq restart

sudo /etc/init.d/dnsmasq status

echo Ping to emnify
-------------------------

ping -c5 emnify.com

nslookup ns=emnify.com

cat /etc/resolv.conf