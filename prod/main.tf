provider "aws" {
  region="us-east-1"
  profile = "MyAWS"
}

module "prod_vpc" {
  source="../modules/vpc"
  mod_vpc_cidr="192.168.0.0/16"
  mod_vpc_tenancy="default"
  mod_vpc_id="${module.prod_vpc.mod_vpc_id}"
  mod_subnet_cidr="192.168.0.0/24"
}

module "prod_sg" {
  source = "../modules/securitygroup"
  sg_vpc_id = "${module.prod_vpc.mod_vpc_id}"
}

module "prod_ec2" {
  source="../modules/ec2"
  ec2_count="2"
  ami_id="ami-013f17f36f8b1fefb"
  instance_type="t2.micro"
  subnet_id="${module.prod_vpc.mod_subnet_id}"
  security_group_ids = ["${module.prod_sg.sgrp-terra_id}"]
  ec2_name_tag = "prod_ec2"
}