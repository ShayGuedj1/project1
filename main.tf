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
}
resource "null_resource" "execute_command" {
  for_each = aws_instance.example_instance
provisioner "local-exec" {
    command = <<EOF
      ssh -i /home/cloud_user/test/projects.pem ec2-user@${each.value.public.ip} 'echo Hello from instance ${each.key}!'
    EOF
  }
}



output "instance-ip" {
  value = [for instance in aws_instance.project1 : instance.public_ip]
}
