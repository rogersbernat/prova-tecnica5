#!/bin/bash


sudo mv /home/debian/sources.list /etc/apt/sources.list

sudo cat /etc/apt/sources.list

sudo apt update && sudo apt install -y dnsmasq dnsutils

sudo service dnsmasq status

sudo groupadd -r dnsmasq
sudo useradd -r -g dnsmasq dnsmasq

sudo mv /home/debian/dnsmasq.conf  /etc/dnsmasq.d/dnsmasq.conf
sudo mv /home/debian/dhclient.conf /etc/dhcp/dhclient.conf

sudo chown dnsmasq: /etc/dnsmasq.d/dnsmasq.conf
sudo chown root: /etc/dhcp/dhclient.conf

dig aws.amazon.com @127.0.0.1

ping -c5 amazon.com

sudo service dnsmasq stop
sudo systemctl disable dnsmasq
