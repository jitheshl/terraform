resource "aws_ssm_parameter" "vpc_id"{
    name = "/${var.project_name}/${var.environment}/mysql_sg_id"
    type = "String"
    value = module.mysql_sg.sg_id
}