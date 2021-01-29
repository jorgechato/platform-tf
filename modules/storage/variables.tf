locals {
  services = [
    {
      name      = "blog"
      hosts     = join(" ", var.blog_hosts)
      listen    = {
        port     = "443",
        protocol = "ssl"
      },
      locations = [
        {
          name = "blog"
          host = "localhost"
          path = ""
          port = "2368"
        }
      ]
    },
    {
      name      = "api"
      hosts     = join(" ", var.api_hosts)
      listen    = {
        port     = "443",
        protocol = "ssl"
      },
      locations = [
        {
          name = "api"
          host = "localhost"
          path = ""
          port = "5000"
        }
      ]
    }
  ]
}

variable "env" {}
variable "project" {}
variable "region" {}
variable "az" {}
variable "bucket" {}

variable "blog_hosts" {}
variable "blog_theme_name" {}
variable "blog_theme_folder" {}
variable "api_hosts" {}
