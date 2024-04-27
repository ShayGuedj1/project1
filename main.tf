provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "project1" {
  count         = var.instance_count
  ami           = var.amis["20.04"]
  instance_type = var.instance_types[0]
  associate_public_ip_address = true  # Assign a public IP to this instance
  key_name      = "projects"
  tags = {
    Name = "web-server-${count.index + 1}"
  }
security_groups = [var.security_groups["docker_sg"]]


provisioner "local-exec" {
  command= "cat /home/cloud_user/.ssh/id_rsa.pub"
}
}
output "instance-ip" {
  value = [for instance in aws_instance.project1 : instance.public_ip]
}
