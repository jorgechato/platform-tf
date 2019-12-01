resource "aws_eip" "elastic-ip" {
  vpc = true

  instance   = var.instance_id
  depends_on = [aws_internet_gateway.gw]

  tags   = {
    Name = "${var.project}-eip"
  }
}
