resource "aws_key_pair" "generated_key" {
  key_name   = "generated_key"
  public_key = "${file(var.public_key_path)}"
  }  
  data "aws_ami" "latest_ecs" {
most_recent = true
owners = ["591542846629"] # AWS

  filter {
      name   = "name"
      values = ["*amazon-ecs-optimized"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }  
}

resource "aws_instance" "instance-to-test" {
  ami           = "resource "aws_key_pair" "generated_key" {
  key_name   = "generated_key"
  public_key = "${file(var.public_key_path)}"
  }  
  data "aws_ami" "latest_ecs" {
most_recent = true
owners = ["591542846629"] # AWS

  filter {
      name   = "name"
      values = ["*amazon-ecs-optimized"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }  
}

resource "aws_instance" "instance-to-test" {
  ami           = "${data.aws_ami.latest_ecs.id}"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "${aws_key_pair.generated_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.ingress-ssh-rule.id}"]

  tags = {
    Name = "instance-to-test"
  }
  subnet_id = "${aws_subnet.subnet-resolver.id}"
}"
  instance_type = "t2.micro"
  associate_public_ip_address = false
  key_name = "${aws_key_pair.generated_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.ingress-ssh-rule.id}"]

  tags = {
    Name = "instance-to-test"
  }
  subnet_id = "${aws_subnet.subnet-resolver.id}"
}