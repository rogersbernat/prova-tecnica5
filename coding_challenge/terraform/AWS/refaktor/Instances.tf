module "instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_count = 1

  name          = "dnsmasq-server${aws_vpc.vpc_id}"
  ami           = ${var.packer-ami}
  instance_type = "t2.micro"
  subnet_id     = tolist(data.aws_subnet_ids.all.ids)[0]
    private_ips                 = ["172.31.32.5", "172.31.46.20"]
  vpc_security_group_ids      = [module.security_group_vpc.security_group_vpc_id]
  associate_public_ip_address = false
  placement_group             = aws_placement_group.web.id

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 5
      encrypted   = true
      kms_key_id  = aws_kms_key.this.arn
    }
  ]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}