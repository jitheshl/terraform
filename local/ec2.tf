resource "aws_instance" "instance" {
  ami                    = local.ami_id
  vpc_security_group_ids = [aws_security_group.allow-tls.id]
  instance_type          = local.instance_type
  tags = {
    Name= local.name
    #Name = "terraform-demoserver"
  }
}
resource "aws_security_group" "allow-tls" {
  name        = "allow-tls"
  description = "allow inbound and outbound traffic"

  ingress {
    from_port   = local.ingressfrom_port
    to_port     = local.ingressto_port
    protocol    = local.ingress_protocol
    cidr_blocks = local.cidr_blocks
  }
  egress {
    from_port   = local.egressfrom_port
    to_port     = local.egressto_port
    protocol    = local.egress_protocol
    cidr_blocks = local.cidr_blocks
  }

  tags = {
    Name = "allow-tls"

  }
}