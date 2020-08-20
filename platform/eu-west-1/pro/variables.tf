locals {
  hosts    = concat(var.blog_hosts, var.api_hosts, var.grafana_hosts)
  bucket   = "config-${var.project}"
  blog_url = "https://${var.blog_hosts[0]}"
}

variable "env" {
  default = "pro"
}
variable "region" {
  default = "eu-west-1"
}
variable "project" {
  default = "jorgechato-platform"
}
variable "az" {
  description      = "AWS AZ names"
  default          = {
    eu-west-1      = "eu-west-1a"
  }
}
variable "public_key" {}
variable "volume_path" {
  default = "/data"
}

variable "email" {}

# SERVICE variable
# # API
variable "polarstep_user" {}
variable "goodreads_user" {}
variable "goodreads_api_key" {}
variable "api_hosts" {
  type = list
}
# # BLOG
variable "blog_hosts" {
  type = list
}
variable "blog_theme_name" {}
variable "blog_theme_url" {}
variable "blog_theme_folder" {}
variable "blog_image_version" {}
# # Grafana
variable "grafana_hosts" {
  type = list
}
variable "grafana_user" {
  default = "admin"
}
variable "grafana_pwd" {
  default = "admin"
}
