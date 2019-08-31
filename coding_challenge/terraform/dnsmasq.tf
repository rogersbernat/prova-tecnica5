data "aws_ami" "packer-linux-aws-demo-" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["416389928587"] # ME
}

resource "aws_instance" "dnsmasq-server" {
  ami           = "${var.packer-ami}"
  instance_type = "t2.micro"

  private_ip = "${var.dnsmasq-server-private_ip}"
    key_name = "${aws_key_pair.generated_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.ingress-ssh-rule.id}"]
  security_groups = ["${aws_security_group.internal-dns.id}"]
  
  tags = {
    Name = "dnsmasq-server"
  }
  subnet_id = "${aws_subnet.subnet-resolver.id}"
}