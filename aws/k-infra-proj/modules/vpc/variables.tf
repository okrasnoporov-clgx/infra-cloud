variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Whether the VPC supports DNS resolution"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether the VPC assigns DNS hostnames to instances"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}