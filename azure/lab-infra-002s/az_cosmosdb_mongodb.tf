module "cosmosdb" {
  source = "./modules/cosmosdb"

  cosmosdb_name         = "cosmos-${var.environment}-${var.purpose}"
  rg_name               = module.resource-groups.name
  location              = var.location
  environment           = var.environment
  mongodb_database_name = var.mongodb_database_name
  enable_free_tier      = var.cosmosdb_enable_free_tier
  enable_serverless     = var.cosmosdb_enable_serverless
  purpose               = var.purpose
  # ip_range_filter       = var.cosmosdb_ip_range_filter
}
