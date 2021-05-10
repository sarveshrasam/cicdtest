resource "aws_security_group" "terra_sg" {
  name        = "allow_SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${var.sg_vpc_id}"

  ingress {
    # SSH Port 22 allowed from any IP
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
      # SSH Port 22 allowed from any IP
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sgrp-terra_id" {
  value = "${aws_security_group.terra_sg.id}"
}