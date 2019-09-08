#!/bin/bash

-- updating repo --

sudo apt update && sudo apt install -y dnsmasq

sudo mv /home/ubuntu/dnsmasq.conf  /etc/dnsmasq.d/dnsmasq.conf
sudo mv /home/ubuntu/dhclient.conf /etc/dhcp/dhclient.conf
sudo chown dnsmasq: /etc/dnsmasq.d/dnsmasq.conf
sudo chown root: /etc/dhcp/dhclient.conf

sudo service dnsmasq start

sudo chkconfig dnsmasq on

dig aws.amazon.com @127.0.0.1

ping -c5 amazon.com