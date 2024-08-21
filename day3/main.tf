#create vpc 
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/24"
    tags = {
      name = "myvpc"
    }
}

# create ig and attach it to the vpc
resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "myig"
  }
}
# create natagteway
resource "aws_nat_gateway" "dev" {
    allocation_id = aws_eip.dev.id
    subnet_id = aws_subnet.public.id
  
}
  
#create eip
resource "aws_eip" "dev" {
    instance = "{aws_instance.dev.id}"
    domain = "vpc"

  
}


# create subnets 
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    availability_zone_id = "ap-south-1a"
    tags = {
      name = "mysub"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1b"
    tags = {
      name = "pvtsub"
    } 
}

# create route tables and attach it to ig
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
route {
    gateway_id = aws_internet_gateway.dev.id
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dev.id
    carrier_gateway_id = "0.0.0.0/8"
}    
}

# subnets association add subnets into rt
resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.public.id
}

# create security groups
resource "aws_security_group" "sg" {
    name = "sg"
    vpc_id ="aws_vpc.dev.id"
    tags = {
      name = "hema"
    }
ingress {
    description = "connect ssh "
    from_port = 80
    to_port = 80
    protocol = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    description = " connect tcp"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}
}