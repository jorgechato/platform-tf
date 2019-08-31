module "cluster" {
  source = "../../../modules/cluster"

  project = "${var.project}"

  email = "${var.email}"
  hosts = "${local.hosts}"

  volume_path = "${var.volume_path}"

  # BLOG
  blog_url          = "${local.blog_url}"
  blog_hosts        = "${var.blog_hosts}"
  blog_theme_name   = "${var.blog_theme_name}"
  blog_theme_folder = "${var.blog_theme_folder}"

  # API
  github_topic   = "${var.github_topic}"
  github_user    = "${var.github_user}"
  github_token   = "${var.github_token}"
  gist_list      = "${var.gist_list}"
  mailchimp_ds   = "${var.mailchimp_ds}"
  mailchimp_key  = "${var.mailchimp_key}"
  mailchimp_list = "${var.mailchimp_list}"
  location_user  = "${var.location_user}"
  api_hosts      = "${var.api_hosts}"
}
