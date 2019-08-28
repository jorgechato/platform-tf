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
variable "aws_secret_access_key" {}
variable "aws_access_key_id" {}

variable "vpc_main_id" {}
variable "subnet_main_id" {}
variable "ecs_platform_name" {}

variable "mount" {
  type = bool
}
variable "volume_path" {}
