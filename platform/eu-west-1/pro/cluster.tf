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
  polarstep_user    = var.polarstep_user
  goodreads_user    = var.goodreads_user
  goodreads_api_key = var.goodreads_api_key
  api_hosts         = var.api_hosts
}
