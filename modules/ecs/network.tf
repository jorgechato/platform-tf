resource "aws_eip" "elastic-ip" {
  vpc = true

  instance   = "${aws_instance.platform.id}"
  depends_on = ["aws_internet_gateway.gw"]

  tags   = {
    Name = "${var.project}-eip"
  }
}

resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags   = {
    Name = "${var.project}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${cidrsubnet(aws_vpc.main.cidr_block, 8, 1)}"
  availability_zone       = "${lookup(var.az, var.region)}"
  map_public_ip_on_launch = true

  depends_on = ["aws_internet_gateway.gw"]

  tags   = {
    Name = "${var.project}-sn"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags   = {
    Name = "ecs-${var.project}-gw"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags   = {
    Name = "ecs-${var.project}-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.r.id}"
}
