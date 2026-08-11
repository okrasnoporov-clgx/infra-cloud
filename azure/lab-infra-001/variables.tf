variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "stage"], var.environment)
    error_message = "Environment must be either dev or stage."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "purpose" {
  description = "Purpose of the project/application"
  type        = string
}

variable "sp_os_type" {
  description = "OS Type for the service plan"
  type        = string
}

variable "sp_sku_name" {
  description = "SKU Name for the service plan"
  type        = string
}

variable "python_version" {
  description = "Python runtime version for the Web App (e.g. '3.11', '3.12')"
  type        = string
}

variable "webapp_app_settings" {
  description = "Additional application settings for the Web App (key-value pairs)"
  type        = map(string)
  default     = {}
}
