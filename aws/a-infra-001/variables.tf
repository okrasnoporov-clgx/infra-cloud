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
