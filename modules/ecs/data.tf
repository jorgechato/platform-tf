data "template_file" "nginx-service-conf" {
  template = "${file("${path.module}/user-data/nginx/service.conf")}"

  vars             = {
    name           = "blog"
    host           = "localhost"
    container_port = "2368"
    hosts          = "${join(" ", "${var.blog_hosts}")}"
  }
}
