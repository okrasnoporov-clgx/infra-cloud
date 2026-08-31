resource "azurerm_service_plan" "servicePlan" {
  name                = var.sp_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = var.sp_os_type
  sku_name            = var.sp_sku_name
}
