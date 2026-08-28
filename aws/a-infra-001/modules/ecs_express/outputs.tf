output "service_arn" {
  description = "ARN of the ECS Express Gateway service"
  value       = aws_ecs_express_gateway_service.this.service_arn
}

output "service_revision_arn" {
  description = "ARN of the current ECS Express service revision"
  value       = aws_ecs_express_gateway_service.this.service_revision_arn
}

output "ingress_paths" {
  description = "Ingress paths exposed by the ECS Express Gateway service"
  value       = aws_ecs_express_gateway_service.this.ingress_paths
}
