resource "aws_key_pair" "dev" {
  key_name   = "${var.project}-key"
  public_key = "${file(pathexpand("~/.ssh/${var.public_key}.pub"))}"
}
