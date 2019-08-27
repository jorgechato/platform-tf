module "storage" {
  source = "../../../modules/storage"

  env     = "${var.env}"
  az      = "${var.az}"
  region  = "${var.region}"
  project = "${var.project}"
  bucket  = "${local.bucket}"

  blog_hosts = "${var.blog_hosts}"
  api_hosts  = "${var.api_hosts}"

  instance_id = "${module.instance.id}"
}
