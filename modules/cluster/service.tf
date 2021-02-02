resource "aws_ecs_service" "nginx-service" {
  count               = 1
  name                = "nginx"
  cluster             = aws_ecs_cluster.platform.id
  task_definition     = aws_ecs_task_definition.nginx-task-definition.arn
  scheduling_strategy = "REPLICA"
  desired_count       = 1
}

resource "aws_ecs_service" "api-service" {
  count               = 1
  name                = "api"
  cluster             = aws_ecs_cluster.platform.id
  task_definition     = aws_ecs_task_definition.api-task-definition.arn
  scheduling_strategy = "REPLICA"
  desired_count       = 1
}

resource "aws_ecs_service" "blog-service" {
  count               = 1
  name                = "blog"
  cluster             = aws_ecs_cluster.platform.id
  task_definition     = aws_ecs_task_definition.blog-task-definition.arn
  scheduling_strategy = "REPLICA"
  desired_count       = 1
}

resource "aws_ecs_service" "postgres-service" {
  count               = 1
  name                = "postgres"
  cluster             = aws_ecs_cluster.platform.id
  task_definition     = aws_ecs_task_definition.postgres-task-definition.arn
  scheduling_strategy = "REPLICA"
  desired_count       = 1
}

resource "aws_ecs_service" "odoo-service" {
  count               = 1
  name                = "odoo"
  cluster             = aws_ecs_cluster.platform.id
  task_definition     = aws_ecs_task_definition.odoo-task-definition.arn
  scheduling_strategy = "REPLICA"
  desired_count       = 1
}
