output "id" {
  description = "ID of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.cosmosdb.id
}

output "name" {
  description = "Name of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.cosmosdb.name
}

output "endpoint" {
  description = "Endpoint URL of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.cosmosdb.endpoint
}

output "mongodb_database_name" {
  description = "Name of the MongoDB database"
  value       = azurerm_cosmosdb_mongo_database.mongodb.name
}

output "primary_mongodb_connection_string" {
  description = "Primary MongoDB connection string (sensitive)"
  value       = azurerm_cosmosdb_account.cosmosdb.primary_mongodb_connection_string
  sensitive   = true
}

output "primary_key" {
  description = "Primary key for the Cosmos DB account (sensitive)"
  value       = azurerm_cosmosdb_account.cosmosdb.primary_key
  sensitive   = true
}
