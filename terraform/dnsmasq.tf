data "aws_ami" "packer-linux-aws-demo-" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["416389928587"] # ME
}

resource "aws_network_interface" "private-ip-dnsmasq" {
  subnet_id = "${aws_subnet.subnet-resolver.id}"
  private_ips = ["${var.dnsmasq-server-private_ip}"]

  attachment {
    instance = "${aws_instance.dnsmasq-server.id}"
    device_index = 1
  }

  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_instance" "dnsmasq-server" {
  ami           = "${var.packer-ami}"
  instance_type = "t2.micro"
   
  associate_public_ip_address = true
  key_name = "${aws_key_pair.generated_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.ingress-ssh-rule.id}"]
  security_groups = ["${aws_security_group.internal-dns.id}"]
  
  tags = {
    Name = "dnsmasq-server"
  }
  subnet_id = "${aws_subnet.subnet-resolver.id}"
}