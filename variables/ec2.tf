resource "aws_instance" "instance" {
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow-tls.id]
  instance_type          = var.instance_type
  tags                   = var.instance_tag
}
resource "aws_security_group" "allow-tls" {
  name        = "allow-tls"
  description = "allow inbound and outbound traffic"

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_block
  }
  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_block
  }

  tags = var.security_tag
}