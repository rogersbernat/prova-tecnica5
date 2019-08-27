
resource "aws_route53_resolver_endpoint" "dns-resolver" {
  name      = "${var.dns-resolver-name}"
  direction = "OUTBOUND"

  security_group_ids = [
    "${aws_security_group.ingress-ssh-rule.id}",
  ]

  ip_address {
    subnet_id = "${aws_subnet.subnet-resolver.id}"
    ip = "10.0.0.55"
  }

    ip_address {
    subnet_id = "${aws_subnet.subnet-2.id}"
  }

  tags = {
    Environment = "prova-tecnica5"
  }
}