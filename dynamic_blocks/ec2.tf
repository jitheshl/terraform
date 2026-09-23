resource "aws_instance" "instance" {
  ami                    = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [aws_security_group.allow-tls.id]
  instance_type          = "t3.micro"
  tags = {
    Name = "terraform-demoserver"
  }
}
resource "aws_security_group" "allow-tls" {
  name        = "allow-tls"
  description = "allow inbound and outbound traffic"

  dynamic "ingress"{
    for_each= var.ingress_port
    content{
      from_port=ingress.value["from_port"]
      to_port=ingress.value["to_port"]
      protocol=ingress.value["protocol"]
      cidr_blocks=ingress.value["cidr_block"]

    }
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