#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install dnsmasq dnsutils -y 

echo "network test"
-----------------------------------

ping -c5 emnify.com

nslookup ns=emnify.com

cat /etc/resolv.conf

sudo mv /home/ubuntu/*  /etc/dnsmasq.d/

ls -las /etc/dnsmasq.d
cat * /etc/dnsmasq.d

sudo systemctl stop systemd-resolved

sudo /etc/init.d/dnsmasq restart

sudo /etc/init.d/dnsmasq status

ping -c10 emnify.com

nslookup ns=emnify.com

cat /etc/resolv.conf