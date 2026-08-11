
module "service-plans" {
  source = "./modules/service-plans"

  sp_name     = "sp-${var.environment}-${var.purpose}"
  environment = var.environment
  location    = var.location
  rg_name     = module.resource-groups.name #var.rg_name
  sp_os_type  = var.sp_os_type
  sp_sku_name = var.sp_sku_name
}

module "web-apps" {
  source = "./modules/web-apps"

  webapp_name     = "app-${var.environment}-${var.purpose}"
  rg_name         = module.resource-groups.name
  location        = var.location
  service_plan_id = module.service-plans.id
  python_version  = var.python_version
  environment     = var.environment
  app_settings    = var.webapp_app_settings
}
