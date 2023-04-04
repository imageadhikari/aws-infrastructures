variable "ami_id" {
    type = string
    default = "ami-007855ac798b5175e"
    description = "ami id for instance"
}
variable "security_groups" {
    type = string
    default = ""
    description = "security group of elb"
}
# variable "instance_type" {}
# variable "max_size" {}
# variable "min_size" {}