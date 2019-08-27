data "template_file" "nginx-task-definition" {
  template = "${file("${path.module}/task-definitions/nginx.json")}"

  vars                         = {
    nginx_image                = "umputun/nginx-le"
    nginx_container_name       = "nginx"
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

data "template_file" "blog-task-definition" {
  template = "${file("${path.module}/task-definitions/blog.json")}"

  vars             = {
    image          = "ghost:2.28.0-alpine"
    container_name = "jorgechato-com"
    email          = "${var.email}"
    url            = "${var.blog_url}"
  }
}

data "aws_ecr_repository" "api" {
  name = "api-jorgechato-com"
}
