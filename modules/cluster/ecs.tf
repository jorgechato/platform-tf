resource "aws_ecs_cluster" "platform" {
  name = "${var.project}-cluster"
}

resource "aws_ecs_task_definition" "nginx-task-definition" {
  family                = "nginx"
  container_definitions = "${data.template_file.nginx-task-definition.rendered}"
  network_mode          = "host"

  volume {
    name      = "nginx"
    host_path = "/etc/config/nginx/service.conf"
  }

  volume {
    name      = "certs"
    host_path = "/etc/nginx/certs"
  }

  tags          = {
    Name        = "nginx"
    Application = "letsencrypt"
  }
}

resource "aws_ecs_task_definition" "api-task-definition" {
  family                = "api"
  container_definitions = "${data.template_file.api-task-definition.rendered}"
  network_mode          = "host"

  tags          = {
    Name        = "API"
    Application = "go"
  }
}

resource "aws_ecs_task_definition" "blog-task-definition" {
  family                = "blog"
  container_definitions = "${data.template_file.blog-task-definition.rendered}"
  network_mode          = "host"

  volume {
    name      = "content"
    host_path = "/data/ghost"
  }

  tags          = {
    Name        = "ghost"
    Application = "blog"
  }
}
