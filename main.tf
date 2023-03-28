module "vpc" {
  source                    = "./modules/vpc"
  region                    = 
  vpc-cidr                  = 
  public-subnet-1-cidr      = 
  public-subnet-2-cidr      = 
  private-subnet-1-cidr     =
  private-subnet-2-cidr     =  
  private-subnet-3-cidr     =
  private-subnet-4-cidr     =  
}

module "ec2" {
    source                    = "./modules/ec2"
    ami_id                    = 
    instance_type             =
    vpc_id                    = 
    name                      = 
    tags                      = 
    subnet_id                 = 
}

module "rds" {
  source = "./modules/rds"
  
}