data "aws_ami" "ami_id"{
    most_recent="true"
    owners=["973714476881"]

    filter{
        name = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }
    filter{
        name = "root-device-type"
        values = ["ebs"]
    }
    filter{
        name = "virtualization-type"
        values = ["hvm"]
    }

}
data "aws_vpc" "default"{
    default=true
}

output "aws_ami_id"{
    value=data.aws_ami.ami_id.id
}
output "aws_vpc"{
    value=data.aws_vpc.default.id
}