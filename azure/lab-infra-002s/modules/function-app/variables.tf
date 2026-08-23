variable "function_app_name" {
  description = "Globally unique name of the Linux Function App."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique, lowercase Storage Account name (3-24 alphanumeric characters)."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "storage_account_name must contain 3-24 lowercase letters or digits."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group for the Function App resources."
  type        = string
}

variable "location" {
  description = "Azure region in which to create the resources."
  type        = string
}

variable "environment" {
  description = "Deployment environment used in resource tags."
  type        = string
  default     = "dev"
}

variable "python_version" {
  description = "Python runtime version for Azure Functions."
  type        = string
  default     = "3.11"
}

variable "app_settings" {
  description = "Additional Function App application settings. Required runtime settings are managed by the module."
  type        = map(string)
  default     = {}
}

variable "instance_memory_in_mb" {
  description = "Memory per Flex Consumption instance in MB. 512 is the least expensive option."
  type        = number
  default     = 512

  validation {
    condition     = contains([512, 2048, 4096], var.instance_memory_in_mb)
    error_message = "instance_memory_in_mb must be 512, 2048, or 4096."
  }
}

variable "maximum_instance_count" {
  description = "Maximum number of concurrently scaled-out Flex instances."
  type        = number
  default     = 10

  validation {
    condition     = var.maximum_instance_count >= 1 && var.maximum_instance_count <= 1000
    error_message = "maximum_instance_count must be between 1 and 1000."
  }
}

variable "tags" {
  description = "Additional tags to apply to all module resources."
  type        = map(string)
  default     = {}
}
