############
# Instance #
############

resource "aws_iam_instance_profile" "ecs-instance-profile" {
  name  = "${var.project}-instance-profile"
  role = "${aws_iam_role.instance.id}"
}
