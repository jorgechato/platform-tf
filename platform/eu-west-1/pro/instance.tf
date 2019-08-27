module "instance" {
  source = "../../../modules/instance"

  env        = "${var.env}"
  project    = "${var.project}"
  az         = "${var.az}"
  ami        = "${var.ami}"
  region     = "${var.region}"

  public_key            = "${var.public_key}"
  aws_secret_access_key = "${var.aws_secret_access_key}"
  aws_access_key_id     = "${var.aws_access_key_id}"

  vpc_main_id       = "${module.network.vpc_main_id}"
  subnet_main_id    = "${module.network.subnet_main_id}"
  ecs_platform_name = "${module.cluster.name}"

  mount       = true
  volume_path = "/data"
}
