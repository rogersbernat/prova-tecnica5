resource "aws_security_group" "ingress-ssh-rule" {
name = "allow-all"
vpc_id = "${aws_vpc.dns-zone.id}"
ingress {
    cidr_blocks = ["0.0.0.0/0"]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}