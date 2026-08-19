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

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "Address spaces assigned to the virtual network."
  type        = list(string)
}

variable "vnet_subnets" {
  description = "Subnets to create in the virtual network."
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
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

# Azure Functions (Flex Consumption)

variable "function_app_name" {
  description = "Globally unique name of the Azure Function App."
  type        = string
}

variable "function_storage_account_name" {
  description = "Globally unique, lowercase Storage Account name for the Function App."
  type        = string
}

variable "function_python_version" {
  description = "Python runtime version for the Flex Consumption Function App."
  type        = string
  default     = "3.11"
}

variable "function_app_settings" {
  description = "Additional application settings for the Function App."
  type        = map(string)
  default     = {}
}

variable "function_instance_memory_in_mb" {
  description = "Memory per Flex Consumption instance in MB."
  type        = number
  default     = 512
}

variable "function_maximum_instance_count" {
  description = "Maximum number of Function App instances."
  type        = number
  default     = 10
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

variable "mongo_server_version" {
  description = "MongoDB API version for Cosmos DB"
  type        = string
  default     = "4.2"
}
