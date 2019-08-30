resource "aws_iam_role" "instance" {
  name               = "${var.project}-instance-role"
  assume_role_policy = "${file("${path.module}/iam/instance.json")}"
}

resource "aws_iam_role_policy" "instance" {
  name = "${var.project}-instance-policy"
  role   = "${aws_iam_role.instance.name}"
  policy = "${data.template_file.intance-policy.rendered}"
}

resource "aws_iam_instance_profile" "ecs-instance-profile" {
  name  = "${var.project}-instance-profile"
  role = "${aws_iam_role.instance.id}"
}
