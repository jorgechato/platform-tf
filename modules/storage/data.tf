data "template_file" "nginx-service-conf" {
  count = 2

  template = "${file("${path.module}/data/nginx/service.conf")}"

  vars             = {
    name           = "${lookup("${local.nginx_names}", "${count.index}")}"
    host           = "localhost"
    container_port = "${lookup("${local.nginx_ports}", "${count.index}")}"
    hosts          = "${lookup("${local.nginx_hosts}", "${count.index}")}"
  }
}
