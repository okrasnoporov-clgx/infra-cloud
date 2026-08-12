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

# ─── CosmosDB ────────────────────────────────────────────────────────────────

variable "mongodb_database_name" {
  description = "Name of the MongoDB database inside Cosmos DB"
  type        = string
}

variable "cosmosdb_enable_free_tier" {
  description = "Enable Cosmos DB Free Tier (1000 RU/s + 25 GB free). Only 1 per subscription allowed."
  type        = bool
}

variable "cosmosdb_enable_serverless" {
  description = "Enable Cosmos DB Serverless mode (pay-per-request). Alternative to Free Tier."
  type        = bool
}

variable "cosmosdb_ip_range_filter" {
  description = "Comma-separated list of IP ranges to allow access to Cosmos DB (empty = allow all Azure services)"
  type        = string
  default     = ""
}
