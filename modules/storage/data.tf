data "template_file" "s3-role-policy" {
  template = "${file("${path.module}/policy/s3.json")}"

  vars     = {
    bucket = "${var.bucket}"
  }
}
