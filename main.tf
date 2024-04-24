provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "project1" {
  ami           = var.amis["20.04"]
  instance_type = var.instance_types[0]
}

resource "aws_security_group" "docker-permission" {
  name        = var.security_groups.docker_sg 
}


output "instance-ip" {
  value = aws_instance.project1.public_ip
}