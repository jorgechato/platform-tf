locals {
  services = [
    {
      name  = "blog"
      port  = "2368"
      host  = "localhost"
      hosts = "${join(" ", "${var.blog_hosts}")}"
    },
    {
      name  = "api"
      port  = "5000"
      host  = "localhost"
      hosts = "${join(" ", "${var.api_hosts}")}"
    }
  ]
}

variable "env" {}
variable "project" {}
variable "region" {}
variable "az" {}
variable "bucket" {}

variable "blog_hosts" {}
variable "api_hosts" {}
