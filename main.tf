provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "devops-vm-1" {
  ami="ami-096fda3c22c1c990a"
  instance_type="t2.micro"
  availability_zone="us-east-1a"
  associate_public_ip_address = "true"
  key_name = "KP_MARCH_2021"
  tags = {
    Name = "LB-INSTANCE-1"
  }
}

output "pubid" {
  value = "${aws_instance.devops-vm-1.public_ip}"
}
