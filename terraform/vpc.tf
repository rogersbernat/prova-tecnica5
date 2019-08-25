resource "aws_internet_gateway" "gw-dns-zone" {
    vpc_id = "${aws_vpc.dns-zone.id}"
}

resource "aws_vpc" "dns-zone" {
    cidr_block = "${var.vpc1_cidr}"
    enable_dns_hostnames = false
    enable_dns_support = true

    tags = {
        Name = "terraform-aws-vpc1"
    }
}

resource "aws_subnet" "subnet-resolver" {
    vpc_id = "${aws_vpc.dns-zone.id}"

    cidr_block = "${var.subnet1_cidr}"
    availability_zone = "eu-west-1a"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "Subnet dns-zone"
    }
}
resource "aws_subnet" "subnet-2" {
    vpc_id = "${aws_vpc.dns-zone.id}"

    cidr_block = "${var.subnet2_cidr}"
    availability_zone = "eu-west-1c"

    tags = {
        Name = "Subnet 2"
    }
}

resource "aws_route_table" "route-default-test-env" {
  vpc_id = "${aws_vpc.dns-zone.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw-dns-zone.id}"
  }
tags = {
    Name = "default-route-table"
  }
}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet-resolver.id}"
  route_table_id = "${aws_route_table.route-default-test-env.id}"
}