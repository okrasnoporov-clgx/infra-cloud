module "vnet" {
  source = "./modules/vnet"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource-groups.name
  address_space       = var.vnet_address_space
  subnets             = var.vnet_subnets
  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_private_dns_zone" "cosmosdb_mongo" {
  name                = var.cosmosdb_private_dns_zone_name
  resource_group_name = module.resource-groups.name

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "cosmosdb_mongo" {
  name                 = var.cosmosdb_private_dns_link_name
  private_dns_zone_id  = azurerm_private_dns_zone.cosmosdb_mongo.id
  virtual_network_id   = module.vnet.id
  registration_enabled = false

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

module "cosmosdb_private_endpoint" {
  source = "./modules/private-endpoints"

  name                = var.cosmosdb_private_endpoint_name
  location            = var.location
  resource_group_name = module.resource-groups.name
  subnet_id           = module.vnet.subnet_ids["private_endpoints"]
  target_resource_id  = module.cosmosdb.id

  private_service_connection_name = var.cosmosdb_private_endpoint_connection_name
  subresource_names               = var.cosmosdb_private_endpoint_subresource_names
  private_dns_zone_ids            = [azurerm_private_dns_zone.cosmosdb_mongo.id]
  private_dns_zone_group_name     = var.cosmosdb_private_endpoint_private_dns_zone_group_name
  tags                            = var.cosmosdb_private_endpoint_tags
}
