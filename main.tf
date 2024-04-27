provider "aws" {
  region = "us-east-1"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

resource "aws_instance" "project1" {
  count         = var.instance_count
  ami           = var.amis["20.04"]
  instance_type = var.instance_types[0]
  key_name      = "projects"
  tags = {
    Name = "web-server-${count.index + 1}"
  }
security_groups = [var.security_groups["docker_sg"]]
}

#resource "aws_security_group" "docker-permission" {
#  name        = var.security_groups.docker_sg 
#}


output "instance-ip" {
  value = [for instance in aws_instance.project1 : instance.public_ip]
}
