#!/bin/bash

sudo apt update && sudo apt install -y dnsmasq

sudo groupadd -r dnsmasq
sudo useradd -r -g dnsmasq dnsmasq

sudo mv /home/ubuntu/dnsmasq.conf  /etc/dnsmasq.d/dnsmasq.conf
sudo mv /home/ubuntu/dhclient.conf /etc/dhcp/dhclient.conf

sudo chown dnsmasq: /etc/dnsmasq.d/dnsmasq.conf
sudo chown root: /etc/dhcp/dhclient.conf

dig aws.amazon.com @127.0.0.1

ping -c5 amazon.com

sudo service dnsmasq stop
sudo systemctl disable dnsmasq
