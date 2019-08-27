data "template_file" "user-data" {
  template = "${file("${path.module}/data/user-data.sh")}"

  vars                    = {
    cluster               = "${var.ecs_platform_name}"
    region                = "${var.region}"
    aws_access_key_id     = "${var.aws_access_key_id}"
    aws_secret_access_key = "${var.aws_secret_access_key}"

    mount       = "${var.mount}"
    volume_path = "${var.volume_path}"
  }
}
