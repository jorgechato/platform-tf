resource "aws_iam_policy" "s3" {
  name   = "${var.project}-from-s3-to-ec2-policy"
  policy = "${data.template_file.s3-role-policy.rendered}"
}

resource "aws_iam_user_policy_attachment" "s3-to-ec2" {
  user       = "${var.aws_user_name}"
  policy_arn = "${aws_iam_policy.s3.arn}"
}
