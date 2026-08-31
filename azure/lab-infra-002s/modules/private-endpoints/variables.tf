variable "name" {
  description = "Name of the private endpoint resource."
  type        = string
}

variable "location" {
  description = "Azure region for the private endpoint."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the private endpoint will be created."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet that hosts the private endpoint NIC."
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID of the private link target (for example the Web App)."
  type        = string
}

variable "private_service_connection_name" {
  description = "Name of the private service connection."
  type        = string
}

variable "subresource_names" {
  description = "Subresource names to connect to on the target resource."
  type        = list(string)
  default     = ["sites"]
}

variable "private_dns_zone_ids" {
  description = "List of private DNS zone IDs to associate with the endpoint."
  type        = list(string)
  default     = []
}

variable "private_dns_zone_group_name" {
  description = "Name of the private DNS zone group associated with the endpoint."
  type        = string
  default     = "default"
}

variable "tags" {
  description = "Tags assigned to the private endpoint."
  type        = map(string)
  default     = {}
}
