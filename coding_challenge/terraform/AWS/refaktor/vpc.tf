module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  enable_dhcp_options              = true
  dhcp_options_domain_name         = "dns-resolver"
  dhcp_options_domain_name_servers = ["10.0.101.10", "10.10.0.2"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "ssh-sg" {
  source = "terraform-aws-modules/security-group/aws"
  name    	= "ssh"
  description = "ssh from anywhere"
  vpc_id  	= "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules   	= ["ssh-tcp","all-icmp"]
  egress_rules    	= ["all-all"]
}

module "dns-sg" {
  source = "terraform-aws-modules/security-group/aws"
name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC internally"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks      = ["10.0.1.0/24"]
  ingress_rules            = ["dns-53-udp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      description = "DNS udp port"
      cidr_blocks = "10.0.1.0/24"
    },
    {
      rule        = "DNS-tcp"
      cidr_blocks = "10.0.0.0/16"
    },
  ]
}