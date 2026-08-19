resource "azurerm_key_vault" "this" {
  name                          = var.kv_name
  location                      = var.location
  resource_group_name           = var.rg_name
  tenant_id                     = var.tenant_id
  sku_name                      = var.sku_name
  rbac_authorization_enabled    = true
  purge_protection_enabled      = false
  public_network_access_enabled = true

  tags = {
    environment = var.environment
    purpose     = var.purpose
  }
}
