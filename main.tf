resource "aws_instance" "devops-vm-1" {
  ami="ami-03d64741867e7bb94"
  instance_type="t2.micro"
  availability_zone="us-east-1a"
  associate_public_ip_address = "true"
  key_name = "KP_MARCH_2021"

  tags = {
    Name = "LB-INSTANCE-1"
  }
}
