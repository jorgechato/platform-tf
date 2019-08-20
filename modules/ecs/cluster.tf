resource "aws_ecs_cluster" "platform" {
  name = "${var.project}-cluster"
}

resource "aws_ecs_task_definition" "blog-task-definition" {
  family                = "blog"
  container_definitions = "${data.template_file.blog-task-definition.rendered}"
  network_mode          = "host"

  tags          = {
    Name        = "ghost"
    Application = "blog"
  }
}

data "template_file" "blog-task-definition" {
  template = "${file("${path.module}/task-definitions/blog.json")}"

  vars             =  {
    image          = "ghost:2.28.0-alpine"
    container_name = "jorgechato-com"
    email          = "${var.blog_email}"
    url            = "${var.blog_url}"
  }
}
