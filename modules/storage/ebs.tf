resource "aws_ebs_volume" "main" {
  availability_zone = lookup(var.az, var.region)
  size              = 20
  type              = "standard"

  tags = {
    Name     = "${var.env}-${var.project}-vol"
    Instance = "${var.env}-${var.project}"
  }

  lifecycle {
    prevent_destroy = true
  }
}
