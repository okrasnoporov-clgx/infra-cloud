variable "name" {
  description = "Name of the virtual network."
  type        = string
}

variable "location" {
  description = "Azure region for the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the virtual network."
  type        = string
}

variable "address_space" {
  description = "Address spaces assigned to the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "Subnets to create in the virtual network."
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "tags" {
  description = "Tags assigned to the virtual network."
  type        = map(string)
  default     = {}
}
