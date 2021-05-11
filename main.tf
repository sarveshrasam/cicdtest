provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "devops-vm-1" {
  ami="ami-096fda3c22c1c990a"
  instance_type="t2.micro"
  availability_zone="us-east-1a"
  associate_public_ip_address = "true"
  key_name = "KP_MARCH_2021"
  user_data = << EOF
		#! /bin/bash
                USERKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwsPd5rxNqBIu7PydYvMvP/3PtAUBVhkqiimMGP7ELQs3H15hymJ1GJOHpscR4JRHE8vvoium5nZsKDoF9Iq3uJurD9Oa/yP6pXvUgnbORAY3QTCxk81rmBzwof4fwcNP8i02aF7bHpLablEretptJbvxQYdXAjlPokYEi4NfTNsbw8MP1MiEaVYlgr1LVe33hlvOthdQawKUZaglIGAqpqttIAUpPHR1rFXb4DMTHJRXQKGHHZhiZV0+jXeJLtClyQhPoUzW21yR7B11qlF6qqdu/m+cNX1tdCqQy36zjUST5tryDRpAQIpxCIBlnC7n6KRNlBQYGxjebb3FaQAQ9 ansiadmin@deploymentvm"
		echo "${USERKEY}" | sudo tee -a /home/ec2-user/.ssh/authorized_keys > /dev/null
	      EOF

  tags = {
    Name = "LB-INSTANCE-1"
  }
}

output "pubid" {
  value = "${aws_instance.devops-vm-1.public_ip}"
}
