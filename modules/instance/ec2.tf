resource "aws_instance" "platform" {
  key_name               = aws_key_pair.dev.key_name
  ami                    = data.aws_ami.ecs-optimized.id
  availability_zone      = lookup(var.az, var.region)
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance-base.id]
  subnet_id              = var.subnet_main_id
  iam_instance_profile   = aws_iam_instance_profile.ecs-instance-profile.name
  security_groups        = [
    aws_security_group.instance-base.id,
    aws_security_group.instance-ssh.id
  ]
  depends_on             = [aws_iam_role_policy.instance]

  user_data = data.template_file.user-data.rendered

  tags = {
    Name    = "${var.env}-${var.project}"
    Cluster = "${var.project}-cluster"
    Project = var.project
  }

  volume_tags = {
    Name     = "${var.env}-${var.project}-main-vol"
    Instance = "${var.env}-${var.project}"
  }
}

resource "aws_key_pair" "dev" {
  key_name   = "${var.project}-key"
  public_key = file(pathexpand("~/.ssh/${var.public_key}.pub"))
}

resource "aws_volume_attachment" "persistent" {
  device_name = "/dev/sdh"
  volume_id   = var.volume_id
  instance_id = aws_instance.platform.id

  provisioner "local-exec" {
    when    = destroy
    command = "aws ec2 stop-instances --instance-ids ${self.instance_id}"
  }
}
