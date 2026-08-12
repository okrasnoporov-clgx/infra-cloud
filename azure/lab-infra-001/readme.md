create basic Azure infrastructure for lab and development using terraform.

Steps:

1. Subscription and Resource Group
2. Virtual Network
3. Subnets
4. Network Security Groups
5. Network Interfaces


PROVIDERS:

az provider register --namespace Microsoft.Web --subscription SUBSCRIBTION_ID
az provider register --namespace Microsoft.DocumentDB --subscription SUBSCRIBTION_ID
az provider register --namespace Microsoft.Quota --subscription SUBSCRIBTION_ID

resource_providers_to_register (azurerm >= 3.x):

provider "azurerm" {
  features {}
  resource_providers_to_register = ["Microsoft.Web"]
}


COSMOSDB MongoDB:

Connection strings
az cosmosdb keys list --name cosmos-dev-webservice --resource-group rg-dev-webservice --type connection-strings


