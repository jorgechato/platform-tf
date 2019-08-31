data "template_file" "nginx-task-definition" {
  template = "${file("${path.module}/task-definitions/nginx.json")}"

  vars             = {
    image          = "umputun/nginx-le"
    container_name = "nginx"
    email          = "${var.email}"
    hosts          = "${join(",", "${var.hosts}")}"
  }
}

data "template_file" "api-task-definition" {
  template = "${file("${path.module}/task-definitions/api.json")}"

  vars             = {
    image          = "${data.aws_ecr_repository.api.repository_url}:latest"
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
    image          = "ghost:${var.blog_image_version}-alpine"
    version        = "${var.blog_image_version}"
    container_name = "jorgechato-com"
    email          = "${var.email}"
    url            = "${var.blog_url}"
  }
}

data "aws_ecr_repository" "api" {
  name = "${var.repo_name_api}"
}
