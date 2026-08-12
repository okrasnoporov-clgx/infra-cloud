variable "cosmosdb_name" {
  description = "Name of the Cosmos DB account"
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

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "mongodb_database_name" {
  description = "Name of the MongoDB database to create inside Cosmos DB"
  type        = string
  default     = "appdb"
}

variable "enable_free_tier" {
  description = "Enable Cosmos DB Free Tier (1000 RU/s + 25 GB free). Only 1 allowed per subscription."
  type        = bool
  default     = true
}

variable "enable_serverless" {
  description = "Enable Serverless mode (pay-per-use). Mutually exclusive with Free Tier autoscale throughput."
  type        = bool
  default     = false
}

variable "autoscale_max_throughput" {
  description = "Max autoscale throughput in RU/s (minimum 1000). Used only when not in serverless mode."
  type        = number
  default     = 1000
}


variable "purpose" {
  description = "Purpose of the Cosmos DB account"
  type        = string
}
