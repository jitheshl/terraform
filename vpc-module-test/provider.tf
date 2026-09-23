terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.63.0"
    }
    }
    backend "s3"{
        bucket = "jithesh-tf-remote-state"
        key = "vpc-test" #we should have unique key with in the bucket, same key should not be used in other purpose 
        region = "us-east-1"
        dynamodb_table = "jithesh-state-locking"
    }

}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}