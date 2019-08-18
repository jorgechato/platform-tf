resource "aws_launch_configuration" "launch" {
  name                          = "${var.env}-${var.project}"
  image_id                      = "${lookup(var.ami, var.region)}"
  instance_type                 = "t2.micro"
  # security_groups             = [""]
  # user_data                   = ""
  iam_instance_profile          = "${aws_iam_instance_profile.ecs-instance-profile.name}"
  depends_on                    = ["aws_iam_role_policy_attachment.ecs-instance-role"]

  associate_public_ip_address = true
}
