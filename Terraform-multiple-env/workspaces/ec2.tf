resource "aws_instance" "instance" {
  ami                    = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [aws_security_group.allow-tls.id]
  instance_type          = lookup(var.instance_type , terraform.workspace)
  tags = {
    Name = "terraform-demoserver-${terraform.workspace}"
  }
}
resource "aws_security_group" "allow-tls" {
  name        = "allow-tls-${terraform.workspace}"
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