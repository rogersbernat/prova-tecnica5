resource "aws_vpc" "resolver-1" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = false
    enable_dns_support = true

    tags = {
        Name = "terraform-aws-vpc"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.resolver-1.id}"
}

resource "aws_subnet" "subnet-resolver-1" {
    vpc_id = "${aws_vpc.resolver-1.id}"

    cidr_block = "${var.subnet1_cidr}"
    availability_zone = "eu-west-1a"

    tags = {
        Name = "Subnet 1"
    }
}
resource "aws_subnet" "subnet-resolver-2" {
    vpc_id = "${aws_vpc.resolver-1.id}"

    cidr_block = "${var.subnet2_cidr}"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "Subnet 2"
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_all"
    description = "Allow inbound SSH traffic from my IP"
    vpc_id      = "${aws_vpc.resolver-1.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name = "Allow SSH"
    }
}
