resource "aws_security_group" "aws_security_group.sg1.id" {
  name        = "aws_security_group.sg1.id"
  description = "Allow TLS inbound traffic"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    #cidr_blocks = 1.1.1.1/32
  }

  tags = {
    Name = "aws_security_group.sg1.id"
  }
}

resource "aws_route53_resolver_endpoint" "foo" {
  name      = "foo"
  direction = "INBOUND"

  security_group_ids = [
    "${aws_security_group.sg1.id}",
    "${aws_security_group.sg2.id}",
  ]

  ip_address {
    subnet_id = "${aws_subnet.sn1.id}"
  }

  ip_address {
    subnet_id = "${aws_subnet.sn2.id}"
    ip        = "10.0.64.4"
  }

  tags {
    Environment = "Prod"
  }
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}