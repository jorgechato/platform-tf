resource "aws_security_group" "instance-base" {
  name        = "${var.project}-base"
  description = "Allow all inbound/outbound traffic on http + https"
  vpc_id      = var.vpc_main_id

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "instance-ssh" {
  name        = "${var.project}-ssh"
  description = "Allow ssh traffic on 22"
  vpc_id      = var.vpc_main_id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
