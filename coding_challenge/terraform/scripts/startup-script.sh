#/bin/bash

## The idea is to pass dinamically the DNS server settings knowing the gateway assigned by default from the DHCP server
##we collect the gateway assigned by the DHCP
GATEWAY=$(netstat -rn|grep '0.0.0.0'|head -1|awk '{print $2}')

echo $GATEWAY > /home/ubuntu/gateway.txt

##we split the base addr (remove the last octet and add the default AWS DNS server in the VPN that is base+2)
BASEADDR="$(echo $GATEWAY | cut -d. -f1-3)"
DNSSERVER="$(echo $BASEADDR.2)"

##Then verify that we have this settings:
echo "gateway $GATEWAY"
echo "dns-server $DNSSERVER"
## replacing configuration
sudo sed -i -e "s/#dns-server#/${DNSSERVER}/g" /etc/dnsmasq.d/dnsmasq.conf
sudo sed -i -e "s/#dns-server#/${DNSSERVER}/g" /etc/dhcp/dhclient.conf

sudo systemctl enable dnsmasq

sudo service dnsmasq start