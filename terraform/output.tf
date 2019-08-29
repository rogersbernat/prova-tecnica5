output "instance-ip" {
value = ["${aws_instance.instance-to-test.public_ip}"]
}
output "dnsmasq-server-public-ip" {
value = ["${aws_instance.dnsmasq-server.public_ip}"]
}
output "dnsmasq-server-private-ip" {
value = ["${aws_instance.dnsmasq-server.private_ip}"]
}