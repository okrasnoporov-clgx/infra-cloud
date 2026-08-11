resource "azurerm_management_group" "non-prod" {
  name         = var.name
  display_name = var.display_name
}
