terraform {
  required_version = ">=1.15"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=5.0.0 ,  <=5.0.1"
    }
  }

}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
  resource_providers_to_register = ["Microsoft.Web", "Microsoft.Quota", "Microsoft.DocumentDB", "Microsoft.Storage"]

}
