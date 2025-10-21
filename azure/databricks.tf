resource "azurerm_databricks_workspace" "databricks_workspace-001-dbw" {
  name                = "dadatabricks_workspace-001-dbw"
  resource_group_name = var.rg
  location            = var.location
  sku                 = "standard"

  tags = var.tags
}