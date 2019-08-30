data "template_file" "user-data" {
  template = "${file("${path.module}/data/user-data.sh")}"

  vars                    = {
    cluster               = "${var.ecs_platform_name}"
    region                = "${var.region}"
    bucket                = "${var.bucket}"

    mount       = "${var.mount}"
    volume_path = "${var.volume_path}"
  }
}

data "template_file" "intance-policy" {
  template = "${file("${path.module}/iam/policy/instance.json")}"

  vars     = {
    bucket = "${var.bucket}"
  }
}

data "aws_instance" "platform" {
  filter {
    name = "tag:Name"
    values = ["${var.env}-${var.project}"]
  }
}
