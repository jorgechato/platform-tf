resource "aws_s3_bucket" "s3-config" {
  bucket = "${var.bucket}"
  acl    = "private"

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
  }

  tags   =  {
    Name = "Platform configuration files"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-terraform-state-storage" {
  bucket = "${aws_s3_bucket.s3-config.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_object" "nginx-service-conf" {
  count = 2

  key     = "nginx/service${count.index}.conf"
  bucket  = "${aws_s3_bucket.s3-config.id}"
  content = "${element(data.template_file.nginx-service-conf.*.rendered, "${count.index}")}"
}
