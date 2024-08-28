#create vpc for alb
resource "aws_vpc" "cust" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }

}
#internet gateway need to create for vpc to external commmunication and attach to vpc 
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.cust.id
  tags = {
    Name = "myIG"
  }
  depends_on = [aws_vpc.cust]

}
# for alb we need public subnet to connect external communication like clinet and we need to avaliabality zone tor mapping 
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.cust.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public-subnet"
  }
  depends_on = [aws_vpc.cust]
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.cust.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "publicsubnet-2"
  }
  depends_on = [aws_subnet.public]
}