resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true

  tags   = {
    Name = "${var.project}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 0)
  availability_zone       = lookup(var.az, var.region)

  depends_on = ["aws_internet_gateway.gw"]

  tags   = {
    Name = "${var.project}-sn"
  }
}
