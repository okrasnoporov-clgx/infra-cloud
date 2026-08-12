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

