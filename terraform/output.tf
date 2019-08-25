output "instance-ip" {
value = ["${aws_instance.instance-to-test.public_ip}"]
}