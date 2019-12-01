provider "aws" {
  region  = var.region
  profile = "default"

  version = "~> 2.24.0"
}
