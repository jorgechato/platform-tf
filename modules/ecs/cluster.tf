resource "aws_ecs_cluster" "platform" {
  name = "${var.project}-cluster"
}

resource "aws_ecs_task_definition" "microservices" {
  family                = "microservices"
  container_definitions = "${file("${path.module}/task-definitions/microservices.json")}"
  network_mode          = "host"

  volume {
    name      = "api-log"
    host_path = "/opt/api.jorgechato.com/log"
  }

  tags           = {
    Applications = "api nginx frontend vpn"
  }
}

resource "aws_ecs_service" "platform" {
  name            = "${var.project}-service"
  cluster         = "${aws_ecs_cluster.platform.id}"
  task_definition = "${aws_ecs_task_definition.microservices.arn}"
  desired_count   = 1
}
