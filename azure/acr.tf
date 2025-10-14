resource "azurerm_container_registry" "dev1-acr" {
  name                = "dev1lab20acr"
  resource_group_name = var.rg
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = var.geo-replica-location1
    zone_redundancy_enabled = true
    tags                    = var.tags
  }
}