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

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "app_settings" {
  description = "Additional application settings (key-value pairs)"
  type        = map(string)
  default     = {}
}
