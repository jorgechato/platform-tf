module "ecs" {
  source = "../../../modules/ecs"

  env     = "${var.env}"
  region  = "${var.region}"
  ami     = "${var.ami}"
  az      = "${var.az}"
  project = "${var.project}"

  # BLOG
  blog_email = "${var.blog_email}"
  blog_url   = "${var.blog_url}"

  # API
  github_topic   = "${var.github_topic}"
  github_user    = "${var.github_user}"
  github_token   = "${var.github_token}"
  gist_list      = "${var.gist_list}"
  mailchimp_ds   = "${var.mailchimp_ds}"
  mailchimp_key  = "${var.mailchimp_key}"
  mailchimp_list = "${var.mailchimp_list}"
  location_user  = "${var.location_user}"
}
