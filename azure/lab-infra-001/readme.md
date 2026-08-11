create basic Azure infrastructure for lab and development using terraform.

Steps:

1. Subscription and Resource Group
2. Virtual Network
3. Subnets
4. Network Security Groups
5. Network Interfaces


PROVIDERS:

az provider register --namespace Microsoft.Web --subscription 4b5f4da7-0329-47db-8f79-a64d15192d2c

resource_providers_to_register (azurerm >= 3.x):

provider "azurerm" {
  features {}
  resource_providers_to_register = ["Microsoft.Web"]
}