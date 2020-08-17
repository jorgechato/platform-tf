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
# # Grafana
variable "grafana_image_version" {
  default = "7.1.0"
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
