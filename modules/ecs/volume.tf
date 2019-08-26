resource "aws_ebs_volume" "main" {
  availability_zone = "${lookup(var.az, var.region)}"
  size              = 20
  type              = "standard"

  lifecycle {
    prevent_destroy = true
  }

  tags       = {
    Name     = "${var.env}-${var.project}-vol"
    Instance = "${var.env}-${var.project}"
  }
}

resource "aws_volume_attachment" "main" {
  device_name  = "/dev/sdh"
  volume_id    = "${aws_ebs_volume.main.id}"
  instance_id  = "${aws_instance.platform.id}"
  skip_destroy = true
  depends_on   = ["aws_instance.platform"]
}
