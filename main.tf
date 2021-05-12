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
  provisioner "local-exec" {
      # method 1: construct inventory from terraform state
      command = "sleep 60; ansible-playbook -i '${aws_instance.terraform-ansible.public_dns},' key-transfer.yml"

      # method 2: use terraform-inventory dynamic inventory script https://github.com/adammck/terraform-inventory
      # command = "sleep 90; ansible-playbook -i /usr/local/bin/terraform-inventory install-webserver.yml"
  }
}

output "pubid" {
  value = "${aws_instance.devops-vm-1.public_ip}"
}
