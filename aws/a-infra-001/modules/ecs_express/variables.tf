variable "service_name" {
  description = "Name of the ECS Express Gateway service"
  type        = string
}

variable "cluster" {
  description = "ECS cluster name or ARN"
  type        = string
  default     = "default"
}

variable "execution_role_arn" {
  description = "IAM execution role ARN"
  type        = string
}

variable "infrastructure_role_arn" {
  description = "IAM infrastructure role ARN"
  type        = string
}

variable "cpu" {
  description = "CPU units for the service task"
  type        = string
  default     = "1024"
}

variable "memory" {
  description = "Memory in MiB for the service task"
  type        = string
  default     = "2048"
}

variable "health_check_path" {
  description = "HTTP health check path"
  type        = string
  default     = "/"
}

variable "image" {
  description = "Container image"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "subnets" {
  description = "Subnets for the service network; provide at least two for custom networking"
  type        = list(string)
  default     = []
}

variable "security_groups" {
  description = "Security groups for the service network"
  type        = list(string)
  default     = []
}

variable "min_task_count" {
  description = "Minimum number of tasks"
  type        = number
  default     = 1
}

variable "max_task_count" {
  description = "Maximum number of tasks"
  type        = number
  default     = 20
}

variable "auto_scaling_metric" {
  description = "Auto-scaling metric"
  type        = string
  default     = "AVERAGE_CPU"
}

variable "auto_scaling_target_value" {
  description = "Auto-scaling target value"
  type        = number
  default     = 60
}

variable "wait_for_steady_state" {
  description = "Wait for the service to reach steady state"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for the service"
  type        = map(string)
  default     = {}
}
