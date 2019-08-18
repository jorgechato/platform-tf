############
# Instance #
############

resource "aws_iam_instance_profile" "ecs-instance-profile" {
  name  = "${var.project}-instance-profile"
  path  = "/"
  role = "${aws_iam_role.ecs-instance-role.id}"
}
