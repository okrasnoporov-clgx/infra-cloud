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