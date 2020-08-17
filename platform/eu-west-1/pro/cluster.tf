module "cluster" {
  source = "../../../modules/cluster"

  project = var.project

  email = var.email
  hosts = local.hosts

  volume_path = var.volume_path

  # BLOG
  blog_url           = local.blog_url
  blog_hosts         = var.blog_hosts
  blog_theme_name    = var.blog_theme_name
  blog_theme_folder  = var.blog_theme_folder
  blog_image_version = var.blog_image_version

  # API
  polarstep_user = var.polarstep_user
  api_hosts      = var.api_hosts

  # Grafana
  grafana_user = var.grafana_user
  grafana_pwd  = var.grafana_pwd
}
