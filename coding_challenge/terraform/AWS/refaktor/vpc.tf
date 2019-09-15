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

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"
  name    	= "ssh"
  description = "ssh from anywhere"
  vpc_id  	= "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules   	= ["ssh-tcp","all-icmp"]
  egress_rules    	= ["all-all"]
}