resource "aws_route53_resolver_rule" "all" {
  domain_name = "."
  rule_type   = "SYSTEM"
}
resource "aws_route53_resolver_rule_association" "example" {
  resolver_rule_id = "${aws_route53_resolver_rule.all.id}"
  vpc_id           = "${aws_vpc.dns-zone.id}"
}

// my domain in google cloud network:
resource "aws_route53_resolver_rule" "rogersbernat" {
  domain_name          = "rogersbernat.com"
  name                 = "rogersbernat"
  rule_type            = "FORWARD"
  resolver_endpoint_id = "${aws_route53_resolver_endpoint.dns-resolver.id}"

  target_ip {
    ip = "104.27.156.46"
  }

  tags = {
    Environment = "prova-tecnica5"
  }
}

resource "aws_route53_resolver_rule_association" "rogersbernat" {
  resolver_rule_id = "${aws_route53_resolver_rule.rogersbernat.id}"
  vpc_id           = "${aws_vpc.dns-zone.id}"
}