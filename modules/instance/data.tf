data "template_file" "user-data" {
  template = file("${path.module}/data/user-data.sh")

  vars      = {
    cluster = var.ecs_platform_name
    region  = var.region
    bucket  = var.bucket

    mount       = var.mount
    volume_path = var.volume_path

    blog_theme_name   = var.blog_theme_name
    blog_theme_url    = var.blog_theme_url
    blog_theme_folder = var.blog_theme_folder
  }
}

data "template_file" "intance-policy" {
  template = file("${path.module}/iam/policy/instance.json")

  vars     = {
    bucket = var.bucket
  }
}

data "http" "myip" {
  url = "https://www.myexternalip.com/raw"
}

data "aws_ami" "ecs-optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
