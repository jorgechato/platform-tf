resource "aws_ecs_cluster" "platform" {
  name = "${var.project}-cluster"
}

resource "aws_ecs_task_definition" "nginx-task-definition" {
  family                = "nginx"
  container_definitions = "${data.template_file.nginx-task-definition.rendered}"
  network_mode          = "host"
  depends_on            = ["aws_instance.platform"]

  volume {
    name      = "nginx"
    host_path = "/etc/nginx/service.conf"
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
  depends_on            = ["aws_instance.platform"]

  tags          = {
    Name        = "API"
    Application = "go"
  }
}

resource "aws_ecs_task_definition" "blog-task-definition" {
  family                = "blog"
  container_definitions = "${data.template_file.blog-task-definition.rendered}"
  network_mode          = "host"
  depends_on            = ["aws_instance.platform"]

  volume {
    name      = "content"
    host_path = "/data/ghost"
  }

  tags          = {
    Name        = "ghost"
    Application = "blog"
  }
}

data "template_file" "nginx-task-definition" {
  template = "${file("${path.module}/task-definitions/nginx.json")}"

  vars                         = {
    nginx_image                = "umputun/nginx-le"
    nginx_container_name       = "nginx"
    # letsencrypt_image          = "jrcs/letsencrypt-nginx-proxy-companion"
    # letsencrypt_container_name = "letsencrypt"
    email                      = "${var.email}"
    hosts                      = "${join(",", "${var.blog_hosts}")}"
  }
}

data "template_file" "api-task-definition" {
  template = "${file("${path.module}/task-definitions/api.json")}"

  vars             = {
    image          = "${data.aws_ecr_repository.api.repository_url}"
    container_name = "api-jorgechato-com"
    github_topic   = "${var.github_topic}"
    github_token   = "${var.github_token}"
    github_user    = "${var.github_user}"
    gist_list      = "${var.gist_list}"
    mailchimp_list = "${var.mailchimp_list}"
    mailchimp_key  = "${var.mailchimp_key}"
    mailchimp_ds   = "${var.mailchimp_ds}"
    location_user  = "${var.location_user}"
  }
}

data "aws_ecr_repository" "api" {
  name = "api-jorgechato-com"
}

data "template_file" "blog-task-definition" {
  template = "${file("${path.module}/task-definitions/blog.json")}"

  vars             = {
    image          = "ghost:2.28.0-alpine"
    container_name = "jorgechato-com"
    email          = "${var.email}"
    url            = "${var.blog_url}"
  }
}
