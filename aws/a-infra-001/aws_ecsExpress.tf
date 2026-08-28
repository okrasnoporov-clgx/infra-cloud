# module "ecs_express" {
#   source = "./modules/ecs_express"

#   service_name              = var.ecs_express_service_name
#   cluster                   = var.ecs_express_cluster
#   execution_role_arn        = module.iam_roles.role_arns["ecs_express_execution"]
#   infrastructure_role_arn   = module.iam_roles.role_arns["ecs_express_infrastructure"]
#   cpu                       = var.ecs_express_cpu
#   memory                    = var.ecs_express_memory
#   health_check_path         = var.ecs_express_health_check_path
#   image                     = var.ecs_express_image
#   container_port            = var.ecs_express_container_port
#   subnets                   = var.ecs_express_subnets
#   security_groups           = var.ecs_express_security_groups
#   min_task_count            = var.ecs_express_min_task_count
#   max_task_count            = var.ecs_express_max_task_count
#   auto_scaling_metric       = var.ecs_express_auto_scaling_metric
#   auto_scaling_target_value = var.ecs_express_auto_scaling_target_value
#   wait_for_steady_state     = var.ecs_express_wait_for_steady_state
#   tags                      = var.ecs_express_tags

#   depends_on = [aws_iam_role_policy.ecs_express_infrastructure_logs]
# }