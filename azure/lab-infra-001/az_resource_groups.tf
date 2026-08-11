module "resource-groups" {
  source = "./modules/resource-groups"

  rg_name     = var.rg_name
  location    = var.location
  environment = var.environment
}
