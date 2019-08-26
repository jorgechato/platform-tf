variable "project" {}
variable "env" {}
variable "region" {}
variable "ami" {}
variable "az" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "public_key" {}
variable "bucket" {}

variable "email" {}
variable "hosts" {}

# SERVICE variable
# # API
variable "github_topic" {}
variable "github_user" {}
variable "github_token" {}
variable "gist_list" {}
variable "mailchimp_ds" {}
variable "mailchimp_key" {}
variable "mailchimp_list" {}
variable "location_user" {}
variable "api_hosts" {}
# # BLOG
variable "blog_url" {}
variable "blog_hosts" {}
