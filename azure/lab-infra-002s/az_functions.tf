module "function_app" {
  source = "./modules/function-app"

  function_app_name      = var.function_app_name
  storage_account_name   = var.function_storage_account_name
  resource_group_name    = module.resource-groups.name
  location               = var.location
  environment            = var.environment
  python_version         = var.function_python_version
  app_settings           = var.function_app_settings
  instance_memory_in_mb  = var.function_instance_memory_in_mb
  maximum_instance_count = var.function_maximum_instance_count
}
