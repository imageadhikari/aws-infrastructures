variable "ami_id" {
  type = string
  default = "ami-007855ac798b5175e"
  description = "AMI ID to deploy EC2 instance."
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Type of instance to deploy"
}

variable "vpc_id" {
  type = string
  default = "vpc-06c8545f702a3d5f7"
  description = "VPC where we will create EC2 instance"
}

variable "name" {
  type = string
  default = "image_demo"
}

variable "tags" {
  default = {}
  type = map(string)
  description = "A map of tags to add all resources"
}

variable "subnet_id" {
    default = "subnet-0c1bd82bab903fd34"
    # default = "subnet-09a1331e66bf6f46a"
    type = string
    description = "Subnet ID"  
}