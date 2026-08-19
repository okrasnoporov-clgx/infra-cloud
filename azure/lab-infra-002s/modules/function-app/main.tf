resource "azurerm_service_plan" "this" {
  name                = "${var.function_app_name}-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"

  # FC1 is the Flex Consumption SKU: it has no fixed monthly plan charge.
  sku_name = "FC1"

  tags = local.tags
}

resource "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  # Standard locally-redundant storage is the lowest-cost supported option.
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  allow_nested_items_to_be_public = false
  min_tls_version                 = "TLS1_2"

  tags = local.tags
}

resource "azurerm_storage_container" "deployment" {
  name                  = "function-deployment"
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}

resource "azurerm_function_app_flex_consumption" "this" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id

  runtime_name    = "python"
  runtime_version = var.python_version

  storage_container_type      = "blobContainer"
  storage_container_endpoint  = "${azurerm_storage_account.this.primary_blob_endpoint}${azurerm_storage_container.deployment.name}"
  storage_authentication_type = "StorageAccountConnectionString"
  storage_access_key          = azurerm_storage_account.this.primary_access_key

  instance_memory_in_mb  = var.instance_memory_in_mb
  maximum_instance_count = var.maximum_instance_count
  https_only             = true

  site_config {
    minimum_tls_version = "1.2"
  }

  app_settings = merge(
    var.app_settings,
    {
      # Required by the AzureRM provider for Flex Consumption. Deployment storage
      # is configured above, rather than through AzureWebJobsStorage.
    }
  )

  tags = local.tags
}

locals {
  tags = merge(
    {
      environment = var.environment
      managed_by  = "terraform"
    },
    var.tags
  )
}
