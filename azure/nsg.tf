resource "azurerm_network_security_group" "dev-nsg" {
  name                = "dev-nsg"
  location            = var.location
  resource_group_name = var.rg
}