resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      python_version = var.python_version
    }

    # always_on не поддерживается на F1 (Free tier)
    always_on = false
  }

  app_settings = merge(
    {
      # Включить Oryx build при деплое через zip (az webapp deploy)
      "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"

      # Порт на котором слушает FastAPI / uvicorn
      "WEBSITES_PORT" = "8000"
    },
    var.app_settings
  )

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
