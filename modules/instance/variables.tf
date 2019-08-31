variable "env" {}
variable "project" {}
variable "az" {}
variable "ami" {}
variable "bucket" {}
variable "region" {}
variable "instance_type" {
  default = "t2.micro"
}

variable "public_key" {}

variable "vpc_main_id" {}
variable "subnet_main_id" {}
variable "ecs_platform_name" {}

variable "mount" {
  type = bool
}
variable "volume_path" {}
variable "volume_id" {}

variable "blog_theme_name" {}
variable "blog_theme_url" {}
variable "blog_theme_folder" {}
