variable "instance_class" {
  type = string
  default = "db.t3.micro"
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