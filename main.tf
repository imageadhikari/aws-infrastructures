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
  region = "us-east-1"
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
    # ami_id                    = 
    # instance_type             =
    vpc_id                    = module.vpc.vpc_id
    # name                      = 
    # tags                      = 
    subnet_id                 = module.vpc.public_subnet_id[0]
}

module "rds" {
  source                        = "./modules/rds"
  # instance_class                = 
  # storage                       =
  # engine                        = 
  # engine-version                =  
  vpc_id                        = module.vpc.vpc_id 
  security_group                = module.ec2.security_group_id 
  given_subnet_id               = module.vpc.private_subnet_id
}

# module "alb" {
#   source = "./modules/alb"
#   public_subnet_id_1 = module.vpc.public_subnet_id[0]
#   public_subnet_id_2 =  module.vpc.public_subnet_id[1]
#   vpc_id = module.vpc.vpc_id
#   security_group_id = module.ec2.security_group_id  
#   ec2_id = module.ec2.ec2_id
# }

# module "asg" {
  # source = "./modules/asg"
  # ami_id = 
  # security_groups = 
# }

# module "s3" {
#   source = "./modules/s3"  
# }