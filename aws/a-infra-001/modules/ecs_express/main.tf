resource "aws_ecs_express_gateway_service" "this" {
  service_name            = var.service_name
  cluster                 = var.cluster
  execution_role_arn      = var.execution_role_arn
  infrastructure_role_arn = var.infrastructure_role_arn
  cpu                     = var.cpu
  memory                  = var.memory
  health_check_path       = var.health_check_path
  wait_for_steady_state   = var.wait_for_steady_state
  tags                    = var.tags

  primary_container {
    image          = var.image
    container_port = var.container_port
  }

  dynamic "network_configuration" {
    for_each = length(var.subnets) > 0 ? [true] : []

    content {
      subnets         = var.subnets
      security_groups = var.security_groups
    }
  }

  scaling_target {
    min_task_count            = var.min_task_count
    max_task_count            = var.max_task_count
    auto_scaling_metric       = var.auto_scaling_metric
    auto_scaling_target_value = var.auto_scaling_target_value
  }
}
