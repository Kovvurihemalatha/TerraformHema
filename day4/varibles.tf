variable "ami" {
    description = "ami for ec2 instance"
    type = string
    default = ""
  
}

variable "type" {
    description = "instance type"
    type = string
    default = ""
  
}

variable "key-pair" {
    description = "key value pair"
    type = string
    default = ""
  
}