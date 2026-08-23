output "id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = "IDs of the virtual network subnets keyed by subnet key."
  value       = { for key, subnet in azurerm_subnet.this : key => subnet.id }
}
