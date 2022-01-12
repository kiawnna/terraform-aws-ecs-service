// ECS Service.
resource "aws_ecs_service" "ecs-service" {
  name            = "${var.app_name}-${var.environment}-service"
  cluster         = var.ecs_cluster_id
  task_definition = var.task_definition_arn
  desired_count   = var.task_desired_count
  health_check_grace_period_seconds = var.health_check_grace_period
  // Should somehow get this to post to a failed deployments SNS Topic ARn.
  // This will fix the infinite looping when a task fails to start.
//  deployment_circuit_breaker {
//    enable = true
//    rollback = true
//  }
  dynamic network_configuration {
    for_each = var.network_mode == "awsvpc" ? [1] : []
    content {
      subnets = var.subnets
      security_groups = var.security_groups
    }

  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  capacity_provider_strategy {
    capacity_provider = var.capacity_provider_name
    weight = var.capacity_provider_weight
  }

  tags = {
    Name = "${var.app_name}-${var.environment}-service"
    Deployment_Method = "terraform"
    Environment = var.environment
  }
}