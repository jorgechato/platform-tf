############
# Instance #
############

resource "aws_iam_role" "instance" {
  name               = "${var.project}-instance-role"
  assume_role_policy = "${file("${path.module}/roles/instance.json")}"
}

resource "aws_iam_role_policy" "instance" {
  name = "${var.project}-instance-policy"
  role   = "${aws_iam_role.instance.name}"
  policy = "${file("${path.module}/roles/instance-policy.json")}"
}

###########
# Service #
###########

resource "aws_iam_role" "service" {
  name               = "${var.project}-service-role"
  assume_role_policy = "${file("${path.module}/roles/service.json")}"
}

resource "aws_iam_role_policy" "service" {
  name   = "${var.project}-service-policy"
  role   = "${aws_iam_role.service.name}"
  policy = "${file("${path.module}/roles/service-policy.json")}"
}
