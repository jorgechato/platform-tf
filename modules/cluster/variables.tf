variable "project" {}

variable "email" {}
variable "hosts" {}
variable "repo_name_api" {
  default = "api-jorgechato-com"
}

variable "volume_path" {}

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
variable "api_image_version" {
  default = "v1"
}
# # BLOG
variable "blog_image_version" {
  default = "latest"
}
variable "blog_url" {}
variable "blog_hosts" {}
variable "blog_theme_folder" {}
variable "blog_theme_name" {}
# # Grafana
variable "grafana_image_version" {
  default = "7.0.3"
}
variable "grafana_plugins" {
  type    = list
  default = [
    "grafana-piechart-panel",
    "neocat-cal-heatmap-panel"
  ]
}
variable "grafana_user" {}
variable "grafana_pwd" {}
