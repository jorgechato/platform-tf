variable "env" {
  default = "pro"
}
variable "region" {
  default = "eu-west-1"
}

variable "project" {
  default = "jorgechato-platform"
}

variable "ami" {
  description      = "AWS ECS AMI id"
  default          = {
    eu-west-1      = "ami-0ae254c8a2d3346a7"
    eu-west-2      = "ami-0de1dc478496a9e9b"
    eu-west-3      = "ami-0d260f3e5ccd06043"
  }
}

variable "az" {
  description      = "AWS AZ names"
  default          = {
    eu-west-1      = "eu-west-1a"
  }
}

# ENV variable
# # API
variable "github_topic" {}
variable "github_user" {}
variable "github_token" {}
variable "gist_list" {}
variable "mailchimp_ds" {}
variable "mailchimp_key" {}
variable "mailchimp_list" {}
variable "location_user" {}
# # BLOG
variable "blog_email" {}
variable "blog_url" {}
