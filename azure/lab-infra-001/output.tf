output "management_group_id" {
  description = "ID of management group"
  value       = module.management_groups.id
}

output "management_group_name" {
  description = "Name of management group"
  value       = module.management_groups.name
}

output "tenant_id" {
    description = "ID of tenant"
    value       = var.tenant_id
}

output "resource_group_id" {
    description = "ID of resource group"
    value       = module.resource-groups.id
}

output "resource_group_name" {
    description = "Name of resource group"
    value       = module.resource-groups.name
}

output "resource_group_location" {
    description = "Location of resource group"
    value       = module.resource-groups.location
}

output "webapp_id" {
  description = "ID of the Web App"
  value       = module.web-apps.id
}

output "webapp_name" {
  description = "Name of the Web App"
  value       = module.web-apps.name
}

output "webapp_url" {
  description = "URL of the deployed FastAPI Web App"
  value       = "https://${module.web-apps.default_hostname}"
}