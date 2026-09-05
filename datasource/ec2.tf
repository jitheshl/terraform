resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami_id.id
  vpc_security_group_ids = [aws_security_group.allow-tls.id]
  instance_type          = "t3.micro"
  tags = {
    Name = "terraform-demoserver"
  }
}
resource "aws_security_group" "allow-tls" {
  name        = "allow-tls"
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