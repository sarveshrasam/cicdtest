variable "ec2_count" {
  default="1"
}

variable "ami_id" {}

variable "instance_type" {
  default="t2.micro"
}

variable "subnet_id" {}

variable "security_group_ids" {}

variable "ec2_name_tag" {}