resource "azurerm_linux_web_app" "webapp" {
  name                      = var.webapp_name
  resource_group_name       = var.rg_name
  location                  = var.location
  service_plan_id           = var.service_plan_id
  virtual_network_subnet_id = var.vnet_integration_subnet_id

  site_config {
    app_command_line       = var.app_command_line
    vnet_route_all_enabled = var.vnet_route_all_enabled

    application_stack {
      python_version = var.python_version
    }

    # always_on не поддерживается на F1 (Free tier)
    always_on = false

    ip_restriction_default_action = var.ip_restriction_default_action
    scm_use_main_ip_restriction   = true

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions

      content {
        name       = ip_restriction.value.name
        priority   = ip_restriction.value.priority
        action     = ip_restriction.value.action
        ip_address = ip_restriction.value.ip_address
      }
    }
  }

  app_settings = var.app_settings

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
