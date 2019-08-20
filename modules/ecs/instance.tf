resource "aws_launch_configuration" "launch" {
  name                 = "${var.env}-${var.project}-lc"
  image_id             = "${lookup(var.ami, var.region)}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${aws_security_group.instance-sg.id}"]
  # user_data          = ""
  iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.name}"
  depends_on           = ["aws_iam_role_policy.service"]

  associate_public_ip_address = true
}

resource "aws_instance" "platform" {
  ami                    = "${lookup(var.ami, var.region)}"
  availability_zone      = "${lookup(var.az, var.region)}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.instance-sg.id}"]
  subnet_id              = "${aws_subnet.main.id}"
  iam_instance_profile   = "${aws_iam_instance_profile.ecs-instance-profile.name}"
  security_groups        = ["${aws_security_group.instance-sg.id}"]
  depends_on             = ["aws_iam_role_policy.service"]

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.platform.name} >> /etc/ecs/ecs.config
EOF

  associate_public_ip_address = true

  tags      = {
    Name    = "${var.env}-${var.project}"
    Cluster = "${var.project}-cluster"
    Project = "${var.project}"
  }

  volume_tags = {
    Name      = "${var.env}-${var.project}-vol"
    Instance  = "${var.env}-${var.project}"
  }
}
