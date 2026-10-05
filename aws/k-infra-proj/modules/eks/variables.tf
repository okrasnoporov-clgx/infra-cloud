variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "ARN of the IAM role used by the EKS control plane"
  type        = string
}

variable "node_role_arn" {
  description = "ARN of the IAM role used by the EKS worker nodes"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS control plane and worker nodes"
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "EKS requires at least two subnet IDs."
  }
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group"
  type        = list(string)
  default     = ["t3.small"]
}

variable "node_disk_size" {
  description = "Disk size in GiB for each worker node"
  type        = number
  default     = 20
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags applied to EKS and IAM resources"
  type        = map(string)
  default     = {}
}
