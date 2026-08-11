variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "North Europe"
}

variable "rg" {
  description = "Resource group name"
  type        = string
}

variable "geo-replica-location1" {
  description = "First geo-replication location"
  type        = string
  default     = "East US"
}

variable "geo-replica-location2" {
  description = "Second geo-replication location"
  type        = string
  default     = "West Europe"
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {
    environment = "dev"
    purpose     = "labs"
  }
  
}


