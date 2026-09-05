terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.63.0"
    }
  }
  backend "s3" {
    bucket = "jithesh-aws-s3-bucket"
    key    = "expense-backend-infra"  #you should have unique keys with in the bucket, same kay should not be used in other reops or tf project
    region = "us-east-1"
    dynamodb_table = "state-locking"
     

  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}