data "aws_ami" "packer-linux-aws-demo-" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${var.owner-ami}"] # ME
}

resource "aws_instance" "dnsmasq-server" {
  ami           = "${var.packer-ami}"
  instance_type = "t2.micro"

  private_ip = "${var.dnsmasq-server-private_ip}"
    key_name = "${aws_key_pair.generated_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.ingress-ssh-rule.id}"]
  security_groups = ["${aws_security_group.internal-dns.id}"]
  lifecycle  {
    create_before_destroy=true
 }
  provisioner "file" {
    source      = "scripts/startup-script.sh"
    destination = "/tmp/script.sh"
  }
    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }

  tags = {
    Name = "dnsmasq-server"
  }
  subnet_id = "${aws_subnet.subnet-resolver.id}"
}