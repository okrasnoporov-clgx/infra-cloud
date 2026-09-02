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
    delegations = list(object({
      name    = string
      actions = list(string)
    }))
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

variable "webapp_ip_restriction_default_action" {
  description = "Default action for unmatched inbound requests to the Web App."
  type        = string
  default     = "Deny"
}

variable "webapp_ip_restrictions" {
  description = "Access restriction rules for the Web App."
  type = list(object({
    name       = string
    priority   = number
    action     = string
    ip_address = string
  }))
  default = []
}

variable "webapp_vnet_route_all_enabled" {
  description = "Route all outbound traffic from the Web App through the VNet integration subnet."
  type        = bool
  default     = true
}

variable "application_gateway_name" {
  description = "Name of the Azure Application Gateway."
  type        = string
}

variable "application_gateway_public_ip_name" {
  description = "Name of the public IP used by the Application Gateway."
  type        = string
}

variable "application_gateway_subnet_key" {
  description = "Key of the dedicated Application Gateway subnet in vnet_subnets."
  type        = string
}

variable "application_gateway_sku_name" {
  type = string
}

variable "application_gateway_sku_tier" {
  type = string
}

variable "application_gateway_sku_capacity" {
  type = number
}

variable "application_gateway_gateway_ip_configuration_name" {
  type = string
}

variable "application_gateway_frontend_port_name" {
  type = string
}

variable "application_gateway_frontend_port" {
  type = number
}

variable "application_gateway_frontend_ip_configuration_name" {
  type = string
}

variable "application_gateway_backend_pool_name" {
  type = string
}

variable "application_gateway_probe_name" {
  type = string
}

variable "application_gateway_probe_path" {
  type = string
}

variable "application_gateway_probe_interval" {
  type = number
}

variable "application_gateway_probe_timeout" {
  type = number
}

variable "application_gateway_probe_unhealthy_threshold" {
  type = number
}

variable "application_gateway_backend_http_settings_name" {
  type = string
}

variable "application_gateway_backend_port" {
  type = number
}

variable "application_gateway_backend_protocol" {
  type = string
}

variable "application_gateway_request_timeout" {
  type = number
}

variable "application_gateway_http_listener_name" {
  type = string
}

variable "application_gateway_listener_protocol" {
  type = string
}

variable "application_gateway_request_routing_rule_name" {
  type = string
}

variable "application_gateway_request_routing_rule_priority" {
  type = number
}

variable "application_gateway_tags" {
  type    = map(string)
  default = {}
}

variable "cosmosdb_private_endpoint_name" {
  description = "Name of the Cosmos DB private endpoint."
  type        = string
  default     = "pep-cosmosdb"
}

variable "cosmosdb_private_endpoint_connection_name" {
  description = "Name of the private service connection for the Cosmos DB private endpoint."
  type        = string
  default     = "cosmosdb-private-connection"
}

variable "cosmosdb_private_endpoint_subresource_names" {
  description = "Subresources exposed through the Cosmos DB private endpoint."
  type        = list(string)
  default     = ["MongoDB"]
}

variable "cosmosdb_private_endpoint_private_dns_zone_group_name" {
  description = "Name of the private DNS zone group attached to the Cosmos DB private endpoint."
  type        = string
  default     = "cosmosdb-dns-zone-group"
}

variable "cosmosdb_private_endpoint_tags" {
  description = "Tags applied to the Cosmos DB private endpoint."
  type        = map(string)
  default     = {}
}

variable "cosmosdb_private_dns_zone_name" {
  description = "Private DNS zone name used for the Cosmos DB private endpoint."
  type        = string
  default     = "privatelink.mongo.cosmos.azure.com"
}

variable "cosmosdb_private_dns_link_name" {
  description = "Name of the private DNS zone VNet link for the Cosmos DB private endpoint."
  type        = string
  default     = "vnet-cosmosdb-dns-link"
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
