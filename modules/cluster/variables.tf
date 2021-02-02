variable "project" {}

variable "email" {}
variable "hosts" {}
variable "repo_name_api" {
  default = "api-jorgechato-com"
}

variable "volume_path" {}

# SERVICE variable
# # API
variable "polarstep_user" {}
variable "goodreads_user" {}
variable "goodreads_api_key" {}
variable "api_hosts" {}
variable "api_image_version" {
  default = "latest"
}
# # BLOG
variable "blog_image_version" {
  default = "latest"
}
variable "blog_url" {}
variable "blog_hosts" {}
variable "blog_theme_folder" {}
variable "blog_theme_name" {}
# # ODOO
variable "odoo_hosts" {}

variable "odoo_host" {}
variable "odoo_user" {}
variable "odoo_password" {}

variable "odoo_postgres_db" {}
variable "odoo_postgres_password" {}
variable "odoo_postgres_user" {}
