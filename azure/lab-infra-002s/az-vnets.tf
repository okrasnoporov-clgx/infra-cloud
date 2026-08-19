module "vnet" {
  source = "./modules/vnet"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource-groups.name
  address_space       = var.vnet_address_space
  subnets             = var.vnet_subnets
  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
