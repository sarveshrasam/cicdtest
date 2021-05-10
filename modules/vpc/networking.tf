resource "aws_vpc" "mod_vpc" {
  cidr_block       = "${var.mod_vpc_cidr}"
  instance_tenancy = "${var.mod_vpc_tenancy}"

  tags = {
    Name = "mod_vpc"
  }
}

resource "aws_subnet" "mod_subnet" {
  vpc_id     = "${var.mod_vpc_id}"
  cidr_block = "${var.mod_subnet_cidr}"

  tags = {
    Name = "mod_subnet"
  }
}

output "mod_vpc_id" {
  value="${aws_vpc.mod_vpc.id}"
}

output "mod_subnet_id" {
  value = "${aws_subnet.mod_subnet.id}"
}

