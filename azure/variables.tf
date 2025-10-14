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
  default     = "ametrine-dev-rg"
}


