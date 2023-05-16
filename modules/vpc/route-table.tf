resource "aws_route_table" "example1" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block        = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.example.id
  }
  tags = {
    Name = "private-route-table"
  }
}


resource "aws_route_table" "example2" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.example1.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.example1.id
}

resource "aws_route_table_association" "c" {
  subnet_id     = aws_subnet.subnet3.id
  route_table_id = aws_route_table.example2.id
}

resource "aws_route_table_association" "d" {
  subnet_id     = aws_subnet.subnet4.id
  route_table_id = aws_route_table.example2.id
}