resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.type
    key_name = var.key-pair 
     
    lifecycle {
      prevent_destroy = false
    }
}