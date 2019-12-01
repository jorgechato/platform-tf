module "storage" {
  source = "../../../modules/storage"

  env           = var.env
  az            = var.az
  region        = var.region
  project       = var.project
  bucket        = local.bucket

  api_hosts         = var.api_hosts
  blog_hosts        = var.blog_hosts
  blog_theme_folder = var.blog_theme_folder
  blog_theme_name   = var.blog_theme_name
}
