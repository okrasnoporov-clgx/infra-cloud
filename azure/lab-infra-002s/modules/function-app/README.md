# Azure Function App module

Creates a Python Azure Function App using the dedicated `azurerm_function_app_flex_consumption` resource, a Flex Consumption plan (`FC1`), and the required deployment Storage Account. The storage account uses Standard LRS, the least expensive redundancy option.

```hcl
module "function_app" {
  source = "./modules/function-app"

  function_app_name   = "func-dev-example"
  storage_account_name = "stfuncdevexample"
  resource_group_name = module.resource-groups.name
  location            = var.location
  environment         = var.environment
  python_version      = "3.11"
}
```

`function_app_name` and `storage_account_name` must be globally unique in Azure. By default, each Flex instance uses 512 MB of memory and the app can scale to 10 instances. Azure requires every Flex Consumption Function App to reference an `FC1` plan, so the module creates this mandatory plan; it is not a dedicated App Service plan.
