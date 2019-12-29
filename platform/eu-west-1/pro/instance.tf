module "instance" {
  source = "../../../modules/instance"

  env     = var.env
  project = var.project
  az      = var.az
  region  = var.region
  bucket  = local.bucket

  public_key = var.public_key

  vpc_main_id       = module.network.vpc_main_id
  subnet_main_id    = module.network.subnet_main_id
  ecs_platform_name = module.cluster.name
  volume_id         = module.storage.volume_id

  mount             = true
  volume_path       = var.volume_path
  blog_theme_url    = var.blog_theme_url
  blog_theme_name   = var.blog_theme_name
  blog_theme_folder = var.blog_theme_folder
}
