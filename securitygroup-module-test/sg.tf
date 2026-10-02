module "mysql_sg"{
    source = "../../terraform-aws-security-group-module"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    sg_description = "creating the mysql security group"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}