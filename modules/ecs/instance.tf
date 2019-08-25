resource "aws_instance" "platform" {
  key_name               = "${aws_key_pair.dev.key_name}"
  ami                    = "${lookup(var.ami, var.region)}"
  availability_zone      = "${lookup(var.az, var.region)}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.instance-base.id}"]
  subnet_id              = "${aws_subnet.main.id}"
  iam_instance_profile   = "${aws_iam_instance_profile.ecs-instance-profile.name}"
  security_groups        = [
    "${aws_security_group.instance-base.id}",
    "${aws_security_group.instance-ssh.id}"
  ]
  depends_on             = ["aws_iam_role_policy.service"]

  user_data = <<EOF
  #!/bin/bash
  cat <<EOS >> /etc/ecs/ecs.config
  ECS_CLUSTER=${aws_ecs_cluster.platform.name}
  ECS_ENABLE_CONTAINER_METADATA=true
  EOS

  cat ${data.template_file.nginx-service-conf.rendered} > /etc/nginx/service.conf
  EOF

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

data "template_file" "nginx-service-conf" {
  template = "${file("${path.module}/user-data/nginx/service.conf")}"

  vars                  = {
    blog_name           = "blog"
    blog_listening      = "localhost"
    blog_container_port = "2368"
    blog_hosts          = "${join(" ", "${var.blog_hosts}")}"
  }
}
