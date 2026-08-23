variable "webapp_name" {
  description = "Name of the Azure Linux Web App"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "service_plan_id" {
  description = "ID of the App Service Plan to host the Web App"
  type        = string
}

variable "python_version" {
  description = "Python runtime version (e.g. '3.11', '3.12')"
  type        = string
  default     = "3.11"
}

variable "app_command_line" {
  description = "Optional startup command for the Linux Web App."
  type        = string
  default     = null
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "app_settings" {
  description = "Additional application settings (key-value pairs)"
  type        = map(string)
  default     = {}
}

variable "ip_restriction_default_action" {
  description = "Default action for unmatched inbound requests."
  type        = string

  validation {
    condition     = contains(["Allow", "Deny"], var.ip_restriction_default_action)
    error_message = "ip_restriction_default_action must be Allow or Deny."
  }
}

variable "ip_restrictions" {
  description = "Allowed or denied public IP/CIDR rules for the Web App."
  type = list(object({
    name       = string
    priority   = number
    action     = string
    ip_address = string
  }))
  default = []
}
