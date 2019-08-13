terraform {
  backend "s3" {
    bucket = "terraform-backend-jorgechato"
    key    = "2019/ecosystem/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}
