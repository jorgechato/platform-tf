resource "aws_s3_bucket" "s3-config" {
  bucket = var.bucket
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
  bucket = aws_s3_bucket.s3-config.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_object" "nginx-service-conf" {
  key      = "nginx/service.conf"
  bucket   = aws_s3_bucket.s3-config.id
  content  = templatefile("${path.module}/data/nginx/service.conf", { services="${local.services}" })
}

resource "aws_s3_bucket_object" "nginx-conf" {
  key      = "nginx/nginx.conf"
  bucket   = aws_s3_bucket.s3-config.id
  content  = file("${path.module}/data/nginx/nginx.conf")
}
