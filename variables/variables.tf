variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "this devops-practice community ami-id"

}
variable "instance_type" {
  default = "t3.micro"
}

variable "instance_tag" {
  default = {
    Name = "terraform-demoserver"
  }
}


variable "ingress_from_port" {
  default = 22
}

variable "ingress_to_port" {
  type    = number
  default = 22

}
variable "ingress_protocol" {
  type    = string
  default = "tcp"
}

variable "ingress_cidr_block" {
  default = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  default = 0
}

variable "egress_to_port" {
  type    = number
  default = 0

}
variable "egress_protocol" {
  type    = string
  default = "-1"
}

variable "egress_cidr_block" {
  default = ["0.0.0.0/0"]
}

variable "security_tag" {
  default = {
    Name = "allow-tls"

  }
}

