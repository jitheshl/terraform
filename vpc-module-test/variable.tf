variable "project_name"{
    default = "expense"
}

variable "environment" { 
  default     = "dev"
}
variable "cidr_block"{
    default = "10.0.0.0/16"
}

variable "public_cidr_blocks"{
    default =["10.0.1.0/24","10.0.2.0/24"]
}
