Secure Azure infrastructure and isolate resources using terraform.

Steps:

1. Create VNet and Subnets
2. Creat VNet integrations (app-dev-webservice)

PROVIDERS:

az provider register --namespace Microsoft.Network --subscription SUBSCRIBTION_ID

resource_providers_to_register (azurerm >= 5.x):

provider "azurerm" {
  features {}
  resource_providers_to_register = ["Microsoft.Network"]
}



Summary:

Source set:

Resources (non secured and public available):
app-dev-webservice             App Service    Central US
cosmos-dev-webservice          Azure Cosmos DB for MongoDB account (RU)  Central US
func-dev-webservice            Function App   Central US
func-dev-webservice-plan       App Service plan  Central US
kv-dev-webservice              Key vault  Central US
sp-dev-webservice              App Service plan  Central US
stfuncdevwebservice            Storage account  Central US
stfuncdevwebservice-545abfdc-9101-4ee0-9e4c-8df4dfdc4bc3   Event Grid System Topic   Central US

Iteration one set:

add subnet delegation
    App Service -> Outgoing traffic -> VNet