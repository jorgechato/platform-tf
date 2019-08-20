resource "aws_security_group" "instance-sg" {
  description = "controls direct access to application instances"
  vpc_id      = "${aws_vpc.main.id}"
  name        = "${var.project}-instsg"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 2368
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
