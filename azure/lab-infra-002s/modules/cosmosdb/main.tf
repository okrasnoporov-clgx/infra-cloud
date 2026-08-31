resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb_name
  resource_group_name = var.rg_name
  location            = var.location

  kind                 = "MongoDB"
  mongo_server_version = var.mongo_server_version
  offer_type           = "Standard"
  # Free Tier: 1000 RU/s + 25 GB (1 account per Subscription)
  free_tier_enabled = var.enable_free_tier

  minimal_tls_version = "Tls12"
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level = "Session"
  }
  # ip_range_filter                   = toset(split(",", var.ip_range_filter))
  is_virtual_network_filter_enabled = false

  capabilities {
    name = "EnableMongo"
  }

  dynamic "capabilities" {
    for_each = var.enable_serverless ? [1] : []
    content {
      name = "EnableServerless"
    }
  }

  tags = {
    environment = var.environment
    purpose     = var.purpose
  }
}



resource "azurerm_cosmosdb_mongo_database" "mongodb" {
  name                = var.mongodb_database_name
  resource_group_name = var.rg_name
  account_name        = azurerm_cosmosdb_account.cosmosdb.name

  # IF NOT serverless and NOT free tier with autoscale
  dynamic "autoscale_settings" {
    for_each = var.enable_serverless ? [] : [1]
    content {
      max_throughput = var.autoscale_max_throughput
    }
  }
}
