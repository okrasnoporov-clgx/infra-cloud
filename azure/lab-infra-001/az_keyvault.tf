module "key-vault" {
  source = "./modules/key-vault"

  kv_name     = "kv-${var.environment}-${var.purpose}"
  rg_name     = module.resource-groups.name
  location    = var.location
  environment = var.environment
  purpose     = var.purpose
  tenant_id   = var.tenant_id
  sku_name    = "standard"
}
