variable "instance_class" {
  type = string
  default = "db.t2.micro"
  description = "Type of instance class"
}

variable "storage" {
    type = number
    default = 10
    description = "Allocated storage for the RDS instance"  
}

variable "engine" {
    type = string
    default = "mysql"
    description = "Engine type for the RDS"
}

variable "engine-version" {
    type = string
    default = "5.7"
    description = "Engine version for the RDS engine"
}

variable "vpc_id" {
    type = string
    default = "vpc-06c8545f702a3d5f7"
    description = "VPC id to create the rds instance in"
  
}

variable "security_group" {
    type = string
    default = " "
    description = "Same security group of the ec2"  
}

variable "given_subnet_id" {
    type = list(string)
    default = [ "value" ]
    description = "Private subnet ids for the rds instance"
  
}