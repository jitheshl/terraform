# output "ec2-info"{
#     value = aws_instance.instance  ====> my code
# }

output "ec2-info" {
  value = [
    for instance in aws_instance.instance : {
      id                    = instance.id
      ami                   = instance.ami
      instance_type         = instance.instance_type
      public_ip             = instance.public_ip                      #======> chat gpt one
      private_ip            = instance.private_ip
      subnet_id             = instance.subnet_id
      vpc_security_group_ids = instance.vpc_security_group_ids
      availability_zone     = instance.availability_zone
      tags                  = instance.tags
    }
  ]
}
