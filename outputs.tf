### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  awsinstance-ip = aws_instance.devops-vm-1.public_ip
 }
 )
 filename = "inventory"
}
