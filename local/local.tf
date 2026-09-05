locals{
    ami_id = data.aws_ami.ami_id.id
    instance_type = "t3.micro"
    name = "${var.project}-${var.environment}-${var.component}-changed"
    ingressfrom_port =22
    ingressto_port =22
    egressfrom_port =0
    egressto_port =0
    ingress_protocol = "tcp"
    egress_protocol = "-1"
    cidr_blocks= ["0.0.0.0/0"]

}