output "management_group_id" {
  description = "ID of management group"
  value       = module.management_groups.id
}
output "management_group_name" {
  description = "Name of management group"
  value       = module.management_groups.name
}

output "tenant_id" {
  description = "ID of tenant"
  value       = var.tenant_id
}

output "resource_group_id" {
  description = "ID of resource group"
  value       = module.resource-groups.id
}

output "resource_group_name" {
  description = "Name of resource group"
  value       = module.resource-groups.name
}

output "resource_group_location" {
  description = "Location of resource group"
  value       = module.resource-groups.location
}

# ─── Virtual Network ─────────────────────────────────────────────────────────

output "vnet_id" {
  description = "ID of the virtual network."
  value       = module.vnet.id
}

output "vnet_name" {
  description = "Name of the virtual network."
  value       = module.vnet.name
}

output "vnet_subnet_ids" {
  description = "IDs of the virtual network subnets keyed by subnet key."
  value       = module.vnet.subnet_ids
}

output "webapp_id" {
  description = "ID of the Web App"
  value       = module.web-apps.id
}

output "webapp_name" {
  description = "Name of the Web App"
  value       = module.web-apps.name
}

output "webapp_url" {
  description = "URL of the deployed FastAPI Web App"
  value       = "https://${module.web-apps.default_hostname}"
}

# ─── CosmosDB ────────────────────────────────────────────────────────────────

output "cosmosdb_id" {
  description = "ID of the Cosmos DB account"
  value       = module.cosmosdb.id
}

output "cosmosdb_name" {
  description = "Name of the Cosmos DB account"
  value       = module.cosmosdb.name
}

output "cosmosdb_endpoint" {
  description = "Endpoint URL of the Cosmos DB account"
  value       = module.cosmosdb.endpoint
}

output "mongodb_database_name" {
  description = "Name of the MongoDB database"
  value       = module.cosmosdb.mongodb_database_name
}

output "cosmosdb_connection_string" {
  description = "Primary MongoDB connection string (sensitive)"
  value       = module.cosmosdb.primary_mongodb_connection_string
  sensitive   = true
}

output "function_app_id" {
  description = "ID of the Flex Consumption Function App."
  value       = module.function_app.id
}

output "function_app_name" {
  description = "Name of the Flex Consumption Function App."
  value       = module.function_app.name
}

output "function_app_url" {
  description = "Default HTTPS URL of the Function App."
  value       = "https://${module.function_app.default_hostname}"
}

output "function_flex_plan_id" {
  description = "ID of the mandatory FC1 Flex Consumption plan."
  value       = module.function_app.service_plan_id
}

output "function_storage_account_name" {
  description = "Storage Account used for Function App deployment packages."
  value       = module.function_app.storage_account_name
}

# ─── Key Vault ────────────────────────────────────────────────────────────────

output "key_vault_id" {
  description = "ID of the Key Vault"
  value       = module.key-vault.id
}

output "key_vault_name" {
  description = "Name of the Key Vault"
  value       = module.key-vault.name
}

output "key_vault_uri" {
  description = "URI of the Key Vault"
  value       = module.key-vault.vault_uri
}

# ─── Functions ────────────────────────────────────────────────────────────────
