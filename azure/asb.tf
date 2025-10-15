resource "azurerm_servicebus_namespace" "asb1-sbns" {
  name                = "asb1-tfex-sb-ns"
  location            = var.location
  resource_group_name = var.rg
  sku                 = "Standard"

  tags = var.tags
}


# Terraform will perform the following actions:

#   # azurerm_servicebus_namespace.asb1-sbns will be created
#   + resource "azurerm_servicebus_namespace" "asb1-sbns" {
#       + capacity                            = 0
#       + default_primary_connection_string   = (sensitive value)
#       + default_primary_key                 = (sensitive value)
#       + default_secondary_connection_string = (sensitive value)
#       + default_secondary_key               = (sensitive value)
#       + endpoint                            = (known after apply)
#       + id                                  = (known after apply)
#       + local_auth_enabled                  = true
#       + location                            = "northeurope"
#       + minimum_tls_version                 = "1.2"
#       + name                                = "asb1-tfex-sb-ns"
#       + premium_messaging_partitions        = 0
#       + public_network_access_enabled       = true
#       + resource_group_name                 = "ametrine-dev-rg"
#       + sku                                 = "Standard"
#       + tags                                = {
#           + "environment" = "dev"
#           + "purpose"     = "labs"
#         }

#       + network_rule_set (known after apply)
#     }