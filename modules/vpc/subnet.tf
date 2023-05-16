# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.0.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "public-subnet-2"
  }
}

