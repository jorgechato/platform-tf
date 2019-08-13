module "ecs" {
  source         = "../../../modules/ecs"

  github_topic   = "${var.github_topic}"
  github_user    = "${var.github_user}"
  github_token   = "${var.github_token}"
  gist_list      = "${var.gist_list}"
  mailchimp_ds   = "${var.mailchimp_ds}"
  mailchimp_key  = "${var.mailchimp_key}"
  mailchimp_list = "${var.mailchimp_list}"
  location_user  = "${var.location_user}"
}
