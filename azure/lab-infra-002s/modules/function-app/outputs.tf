output "id" {
  description = "Resource ID of the Linux Function App."
  value       = azurerm_function_app_flex_consumption.this.id
}

output "name" {
  description = "Name of the Linux Function App."
  value       = azurerm_function_app_flex_consumption.this.name
}

output "default_hostname" {
  description = "Default hostname of the Function App."
  value       = azurerm_function_app_flex_consumption.this.default_hostname
}

output "service_plan_id" {
  description = "Resource ID of the Flex Consumption service plan."
  value       = azurerm_service_plan.this.id
}

output "storage_account_name" {
  description = "Name of the Storage Account used by the Function App runtime."
  value       = azurerm_storage_account.this.name
}
