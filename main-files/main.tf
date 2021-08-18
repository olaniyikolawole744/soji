terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

resource "aws_instance" "mini_project4" {
  ami             = data.aws_ami.java-ami.id
  key_name        = var.ssh_key
  instance_type   = var.instance_type
  count           = var.resource_count
  user_data       = data.template_file.ansible_installation.template
  #security_groups = [aws_security_group.app_sg.id]
  security_groups = [module.app-sg.sg-id-output]
  subnet_id       = module.app-vpc.subnet-id-project4-output

  tags = {
    Name        = "${var.resource_tag_name}"
    environment = "${var.resource_environment}"
    role        = "${var.resource_role}"
  }
}

module "app-project" {
  source        = "../ec2-module"
  count         = var.module_instance_count
  ami_id        = data.aws_ami.java-ami.id
  key           = var.ssh_key
  instance_type = var.instance_type
  name          = var.module_tag_name[count.index]
  environment   = var.module_environment[count.index]
  role          = var.module_role
  my-sg         = module.app-sg.sg-id-output
  #subnet_id     = aws_subnet.app_vpc_subnet[count.index].id
  subnet_id = module.app-vpc.subnet-id-appproject-output
}

module "app-vpc" {
  source         = "../vpc-module"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name
  #vpc_id                 = var.vpc_id
  network_instance_count = var.network_instance_count
  subnet_cidr_block      = var.subnet_cidr_block
  availability_zone      = var.availability_zone
  map_public_ip          = var.map_public_ip
  rt_cidr_block          = var.rt_cidr_block

}

module "app-sg" {
  source           = "../sg-module"
  sg_name          = var.sg_name
  httpport         = var.httpport
  ingress_protocol = var.ingress_protocol
  sg_cidr_block    = var.sg_cidr_block
  httpport2        = var.httpport2
  httpport3        = var.httpport3
  egress_protocol  = var.egress_protocol
  vpc_id           = module.app-vpc.vpc-id-output
}