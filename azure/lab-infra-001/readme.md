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

Check Mongo API versions and capabilities
az cosmosdb show --name cosmos-dev-webservice --resource-group rg-dev-webservice --query "capabilities"
az cosmosdb show --name cosmos-dev-webservice --resource-group rg-dev-webservice --query "{kind:kind, apiProperties:apiProperties}"
az cosmosdb show --name cosmos-dev-webservice --resource-group rg-dev-webservice --query "{kind:kind, capabilities:capabilities, apiProperties:apiProperties}"


Test connection with DB

mongosh  "mongodb://*****@cosmos-dev-webservice.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@cosmos-dev-webservice@"
Current Mongosh Log ID: 6a7c61827007f8c68432e1d2
Connecting to:          mongodb://<credentials>@cosmos-dev-webservice.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@cosmos-dev-webservice@
Using MongoDB:          4.2.0
Using Mongosh:          2.9.2

For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/


To help improve our products, anonymous usage data is collected and sent to MongoDB periodically (https://www.mongodb.com/legal/privacy-policy).
You can opt-out by running the disableTelemetry() command.

------
   Warning: Non-Genuine MongoDB Detected
   This server or service appears to be an emulation of MongoDB rather than an official MongoDB product.
   Some documented MongoDB features may work differently, be entirely missing or incomplete, or have unexpected performance characteristics.
   To learn more please visit: https://dochub.mongodb.org/core/non-genuine-mongodb-server-warning.
------

globaldb [primary] test> db.runCommand({ ping: 1 })
{ ok: 1 }
globaldb [primary] test> db.runCommand({ buildInfo: 1 })
{
  version: '4.2.0',
  versionArray: [ 4, 2, 0, 0 ],
  bits: 64,
  maxBsonObjectSize: 16777216,
  ok: 1
}

globaldb [primary] test> show dbs
appdb  1.00 KiB