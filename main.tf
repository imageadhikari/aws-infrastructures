terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
  profile = "default"
}

module "vpc" {
  source                    = "./modules/vpc"
  # region                    = 
  # vpc-cidr                  = 
  # public-subnet-1-cidr      = 
  # public-subnet-2-cidr      = 
  # private-subnet-1-cidr     =
  # private-subnet-2-cidr     =  
  # private-subnet-3-cidr     =
  # private-subnet-4-cidr     =  
}

module "ec2" {
    source                    = "./modules/ec2"
#     ami_id                    = 
#     instance_type             =
    vpc_id                    = module.vpc.vpc_id
#     name                      = 
#     tags                      = 
    subnet_id                 = module.vpc.public_subnet_1_id
#     depends_on = [
#       modules.vpc.
#     ]
}

# module "rds" {
#   source                        = "./modules/rds"
  # instance_class                = 
  # storage                       =
  # engine                        = 
  # engine-version                =  
# }


# resource "aws_instance" "ec2_using_vpc" {
#   vpc_id = module.vpc.vpc_id
# }