provider "aws" {
  region="us-east-1"
  profile = "MyAWS"
}

module "dev_vpc" {
  source="../modules/vpc"
  mod_vpc_cidr="192.168.0.0/16"
  mod_vpc_tenancy="default"
  mod_vpc_id="${module.dev_vpc.mod_vpc_id}"
  mod_subnet_cidr="192.168.0.0/24"
}

module "dev_sg" {
  source = "../modules/securitygroup"
  sg_vpc_id = "${module.dev_vpc.mod_vpc_id}"
}

module "dev_ec2" {
  source="../modules/ec2"
  ec2_count="2"
  ami="ami-013f17f36f8b1fefb"
  instance_type="t2.micro"
  subnet_id="${module.dev_vpc.mod_subnet_id}"
  security_group_ids = ["${module.dev_sg.sgrp-terra_id}"]
}