resource "azurerm_virtual_network" "ametrine-vnet" {
  name                = "ametrine-vnet"
  location            = var.location
  resource_group_name = var.rg
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "amt-subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "amt-subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.dev-nsg.id
  }

  tags = {
    environment = "dev"
    purpose     = "labs"
  }
}