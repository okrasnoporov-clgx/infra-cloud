variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_enable_dns_support" {
  description = "Whether the VPC supports DNS resolution"
  type        = bool
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  description = "Whether the VPC assigns DNS hostnames to instances"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "subnet_availability_zone" {
  description = "Availability Zone for the subnet"
  type        = string
}

variable "subnet_map_public_ip_on_launch" {
  description = "Whether instances launched in the subnet receive public IP addresses"
  type        = bool
  default     = false
}

variable "subnet_tags" {
  description = "Additional tags for the subnet"
  type        = map(string)
  default     = {}
}

variable "iam_roles" {
  description = "IAM roles used by the AWS infrastructure"
  type = map(object({
    name                 = string
    assume_role_services = set(string)
    managed_policy_arns  = set(string)
    tags                 = map(string)
  }))
}

variable "ecs_express_service_name" {
  description = "Name of the ECS Express Gateway service"
  type        = string
}

variable "ecs_express_cluster" {
  description = "ECS cluster name or ARN"
  type        = string
}

variable "ecs_express_cpu" {
  description = "CPU units for the ECS Express task"
  type        = string
}

variable "ecs_express_memory" {
  description = "Memory in MiB for the ECS Express task"
  type        = string
}

variable "ecs_express_health_check_path" {
  description = "HTTP health check path"
  type        = string
}

variable "ecs_express_image" {
  description = "Container image for the ECS Express service"
  type        = string
}

variable "ecs_express_container_port" {
  description = "Container port"
  type        = number
}

variable "ecs_express_subnets" {
  description = "Subnets for ECS Express custom networking"
  type        = list(string)
}

variable "ecs_express_security_groups" {
  description = "Security groups for ECS Express custom networking"
  type        = list(string)
}

variable "ecs_express_min_task_count" {
  description = "Minimum number of ECS Express tasks"
  type        = number
}

variable "ecs_express_max_task_count" {
  description = "Maximum number of ECS Express tasks"
  type        = number
}

variable "ecs_express_auto_scaling_metric" {
  description = "ECS Express auto-scaling metric"
  type        = string
}

variable "ecs_express_auto_scaling_target_value" {
  description = "ECS Express auto-scaling target value"
  type        = number
}

variable "ecs_express_wait_for_steady_state" {
  description = "Wait for ECS Express service steady state"
  type        = bool
}

variable "ecs_express_tags" {
  description = "Tags for the ECS Express service"
  type        = map(string)
}
