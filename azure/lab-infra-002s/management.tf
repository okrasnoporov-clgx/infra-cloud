module "management_groups" {
  source = "./modules/management-groups"

  name         = "non-prod"
  display_name = "NonProduction"
}

resource "azurerm_management_group_subscription_association" "dev" {
  management_group_id = module.management_groups.id
  subscription_id     = "/subscriptions/${var.subscription_id}"
}

