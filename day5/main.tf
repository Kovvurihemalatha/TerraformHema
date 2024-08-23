resource "aws_instance" "terra" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    key_name = "linux"
    
  tags = {
    Name = "terra"
  }
}