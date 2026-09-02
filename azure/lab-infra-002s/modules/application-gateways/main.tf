resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_application_gateway" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.this.id
  }

  backend_address_pool {
    name  = var.backend_pool_name
    fqdns = [var.backend_fqdn]
  }

  probe {
    name                                      = var.probe_name
    protocol                                  = var.backend_protocol
    path                                      = var.probe_path
    interval                                  = var.probe_interval
    timeout                                   = var.probe_timeout
    unhealthy_threshold                       = var.probe_unhealthy_threshold
    pick_host_name_from_backend_http_settings = true
  }

  backend_http_settings {
    name                                = var.backend_http_settings_name
    cookie_based_affinity               = "Disabled"
    port                                = var.backend_port
    protocol                            = var.backend_protocol
    request_timeout                     = var.request_timeout
    pick_host_name_from_backend_address = true
    probe_name                          = var.probe_name
  }

  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.listener_protocol
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.backend_pool_name
    backend_http_settings_name = var.backend_http_settings_name
    priority                   = var.request_routing_rule_priority
  }

  tags = var.tags
}