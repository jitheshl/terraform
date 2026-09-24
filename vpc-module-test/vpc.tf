module "vpc"{
    source = "../../terraform-aws-vpc-module"
    project_name = var.project_name
    environment = var.environment
    cidr_block = var.cidr_block
    public_cidr_blocks = var.public_cidr_blocks
}