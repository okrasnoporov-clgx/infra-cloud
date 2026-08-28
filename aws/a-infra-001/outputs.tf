output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.id
}

output "vpc_arn" {
  description = "ARN of the VPC"
  value       = module.vpc.arn
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.vpc.cidr_block
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.vpc_subnet.id
}

output "subnet_arn" {
  description = "ARN of the subnet"
  value       = module.vpc_subnet.arn
}

output "subnet_cidr_block" {
  description = "CIDR block of the subnet"
  value       = module.vpc_subnet.cidr_block
}

output "subnet_availability_zone" {
  description = "Availability Zone of the subnet"
  value       = module.vpc_subnet.availability_zone
}

output "subnet_vpc_id" {
  description = "ID of the VPC containing the subnet"
  value       = module.vpc_subnet.vpc_id
}

### ----------- S3 --------------

output "s3_bucket_id" {
  description = "ID of the S3 bucket"
  value       = module.s3.id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.s3.arn
}

output "s3_bucket_domain_name" {
  description = "Regional domain name of the S3 bucket"
  value       = module.s3.bucket_domain_name
}

### ----------- ECS EXPRESS --------------

# output "ecs_express_service_arn" {
#   description = "ARN of the ECS Express Gateway service"
#   value       = module.ecs_express.service_arn
# }

# output "ecs_express_service_revision_arn" {
#   description = "ARN of the current ECS Express service revision"
#   value       = module.ecs_express.service_revision_arn
# }

# output "ecs_express_ingress_paths" {
#   description = "Ingress paths exposed by the ECS Express Gateway service"
#   value       = module.ecs_express.ingress_paths
# }