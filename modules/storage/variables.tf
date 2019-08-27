locals {
  nginx_names = {
    "0" = "blog"
    "1" = "api"
  }

  nginx_ports = {
    "0" = "2368"
    "1" = "5000"
  }

  nginx_hosts = {
    "0" = "${join(" ", "${var.blog_hosts}")}"
    "1" = "${join(" ", "${var.api_hosts}")}"
  }
}

variable "env" {}
variable "project" {}
variable "region" {}
variable "az" {}
variable "bucket" {}

variable "blog_hosts" {}
variable "api_hosts" {}

variable "instance_id" {}
