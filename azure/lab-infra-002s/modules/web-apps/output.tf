output "id" {
  description = "ID of the Linux Web App"
  value       = azurerm_linux_web_app.webapp.id
}

output "name" {
  description = "Name of the Linux Web App"
  value       = azurerm_linux_web_app.webapp.name
}

output "default_hostname" {
  description = "Default hostname of the Web App (e.g. app-dev-webservice.azurewebsites.net)"
  value       = azurerm_linux_web_app.webapp.default_hostname
}
