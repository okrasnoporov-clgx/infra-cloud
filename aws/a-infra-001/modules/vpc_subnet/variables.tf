variable "vpc_id" {
  description = "ID of the VPC for the subnet"
  type        = string
}

variable "name" {
  description = "Name of the subnet"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether instances launched in the subnet receive public IP addresses"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags for the subnet"
  type        = map(string)
  default     = {}
}
