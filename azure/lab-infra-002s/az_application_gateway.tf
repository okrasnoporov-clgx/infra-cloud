module "application_gateway" {
  source = "./modules/application-gateways"

  name                = var.application_gateway_name
  public_ip_name      = var.application_gateway_public_ip_name
  resource_group_name = module.resource-groups.name
  location            = var.location
  subnet_id           = module.vnet.subnet_ids[var.application_gateway_subnet_key]
  backend_fqdn        = module.web-apps.default_hostname

  sku_name     = var.application_gateway_sku_name
  sku_tier     = var.application_gateway_sku_tier
  sku_capacity = var.application_gateway_sku_capacity

  gateway_ip_configuration_name  = var.application_gateway_gateway_ip_configuration_name
  frontend_port_name             = var.application_gateway_frontend_port_name
  frontend_port                  = var.application_gateway_frontend_port
  frontend_ip_configuration_name = var.application_gateway_frontend_ip_configuration_name
  backend_pool_name              = var.application_gateway_backend_pool_name
  probe_name                     = var.application_gateway_probe_name
  probe_path                     = var.application_gateway_probe_path
  probe_interval                 = var.application_gateway_probe_interval
  probe_timeout                  = var.application_gateway_probe_timeout
  probe_unhealthy_threshold      = var.application_gateway_probe_unhealthy_threshold
  backend_http_settings_name     = var.application_gateway_backend_http_settings_name
  backend_port                   = var.application_gateway_backend_port
  backend_protocol               = var.application_gateway_backend_protocol
  request_timeout                = var.application_gateway_request_timeout
  http_listener_name             = var.application_gateway_http_listener_name
  listener_protocol              = var.application_gateway_listener_protocol
  request_routing_rule_name      = var.application_gateway_request_routing_rule_name
  request_routing_rule_priority  = var.application_gateway_request_routing_rule_priority
  tags                           = var.application_gateway_tags
}
