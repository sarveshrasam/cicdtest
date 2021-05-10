resource "aws_instance" "web" {
  count = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = "yes"
  vpc_security_group_ids = "${var.security_group_ids}"
  key_name = "KP_MARCH_2021"

  tags = {
    Name = "${var.ec2_name_tag}"
  }
}



