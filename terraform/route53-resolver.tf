
resource "aws_route53_resolver_endpoint" "dns-resolver" {
  name      = "dns-resolver"
  direction = "OUTBOUND"

  security_group_ids = [
    "${aws_security_group.allow_ssh.id}",
  ]

  ip_address {
    subnet_id = "${aws_subnet.subnet-resolver-1.id}"
    ip        = "10.0.0.4"
  }

    ip_address {
    subnet_id = "${aws_subnet.subnet-resolver-2.id}"
  }

  tags = {
    Environment = "prova-tecnica5"
  }
}