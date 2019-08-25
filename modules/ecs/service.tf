resource "aws_ecs_service" "nginx-service" {
  count               = 1
  name                = "nginx"
  cluster             = "${aws_ecs_cluster.platform.id}"
  task_definition     = "${aws_ecs_task_definition.nginx-task-definition.arn}"
  scheduling_strategy = "REPLICA"
  desired_count       = 1
  depends_on          = ["aws_iam_role_policy.service"]
}

resource "aws_ecs_service" "api-service" {
  count               = 1
  name                = "api"
  cluster             = "${aws_ecs_cluster.platform.id}"
  task_definition     = "${aws_ecs_task_definition.api-task-definition.arn}"
  scheduling_strategy = "REPLICA"
  desired_count       = 1
  depends_on          = ["aws_iam_role_policy.service"]
}

resource "aws_ecs_service" "blog-service" {
  count               = 1
  name                = "blog"
  cluster             = "${aws_ecs_cluster.platform.id}"
  task_definition     = "${aws_ecs_task_definition.blog-task-definition.arn}"
  scheduling_strategy = "REPLICA"
  desired_count       = 1
  depends_on          = ["aws_iam_role_policy.service"]
}
