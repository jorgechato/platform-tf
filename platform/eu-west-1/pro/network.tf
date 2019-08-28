module "network" {
  source = "../../../modules/network"

  az      = "${var.az}"
  region  = "${var.region}"
  project = "${var.project}"

  instance_id = "${module.instance.id}"
}
