resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ecs-${var.project}-gw"
  }
}

resource "aws_route_table" "r" {
  vpc_id     = aws_vpc.main.id
  depends_on = [
    aws_internet_gateway.gw,
    aws_subnet.main
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "ecs-${var.project}-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.r.id
}
