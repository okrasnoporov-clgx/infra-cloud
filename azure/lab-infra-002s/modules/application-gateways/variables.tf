variable "name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "backend_fqdn" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "sku_tier" {
  type = string
}

variable "sku_capacity" {
  type = number
}

variable "gateway_ip_configuration_name" {
  type = string
}

variable "frontend_port_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "backend_pool_name" {
  type = string
}

variable "probe_name" {
  type = string
}

variable "probe_path" {
  type = string
}

variable "probe_interval" {
  type = number
}

variable "probe_timeout" {
  type = number
}

variable "probe_unhealthy_threshold" {
  type = number
}

variable "backend_http_settings_name" {
  type = string
}

variable "backend_port" {
  type = number
}

variable "backend_protocol" {
  type = string
}

variable "request_timeout" {
  type = number
}

variable "http_listener_name" {
  type = string
}

variable "listener_protocol" {
  type = string
}

variable "request_routing_rule_name" {
  type = string
}

variable "request_routing_rule_priority" {
  type = number
}

variable "tags" {
  type    = map(string)
  default = {}
}