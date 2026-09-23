resource "aws_instance" "instance" {
  for_each= var.instances
  ami                    = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [aws_security_group.allow-tls.id]
  instance_type          = each.value
  tags = {
    Name = "rach.key"
  }
  
}
resource "aws_security_group" "allow-tls" {
  name        = "allow-tlss"
  description = "allow inbound and outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-tls"

  }
}

# output "ec2-info"{
#   value = aws_instance.instance
# }