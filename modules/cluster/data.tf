data "template_file" "nginx-task-definition" {
  template = "${file("${path.module}/task-definitions/nginx.json")}"

  vars = {
    image          = "umputun/nginx-le"
    container_name = "nginx"
    email          = var.email
    hosts          = join(",", var.hosts)
  }
}

data "template_file" "api-task-definition" {
  template = file("${path.module}/task-definitions/api.json")

  vars = {
    image             = "${data.aws_ecr_repository.api.repository_url}:${var.api_image_version}"
    container_name    = "api-jorgechato-com"
    polarstep_user    = var.polarstep_user
    goodreads_user    = var.goodreads_user
    goodreads_api_key = var.goodreads_api_key
  }
}

data "template_file" "blog-task-definition" {
  template = file("${path.module}/task-definitions/blog.json")

  vars = {
    image          = "ghost:${var.blog_image_version}-alpine"
    container_name = "jorgechato-com"
    email          = var.email
    url            = var.blog_url
  }
}

data "template_file" "odoo-task-definition" {
  template = file("${path.module}/task-definitions/odoo.json")

  vars = {
    image          = "odoo:latest"
    container_name = "odoo"
    odoo_host      = "localhost"
    odoo_user      = var.odoo_user
    odoo_password  = var.odoo_password
  }
}

data "template_file" "postgres-task-definition" {
  template = file("${path.module}/task-definitions/postgres.json")

  vars = {
    image                  = "postgres:alpine"
    container_name         = var.odoo_host
    odoo_postgres_db       = var.odoo_postgres_db
    odoo_postgres_password = var.odoo_postgres_password
    odoo_postgres_user     = var.odoo_postgres_user
  }
}

data "aws_ecr_repository" "api" {
  name = var.repo_name_api
}
