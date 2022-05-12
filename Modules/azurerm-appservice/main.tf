# -
# - Get existing resource values
# - 
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# -
# - Create App Service Plan
# - 
resource "azurerm_service_plan" "this" {
  name                       = var.name
  location                   = data.azurerm_resource_group.this.location
  resource_group_name        = data.azurerm_resource_group.this.name
  app_service_environment_id = azurerm_app_service_environment_v3.this.id

  os_type = var.os_type
  sku_name = var.sku_name
  worker_count = var.worker_count
  zone_balancing_enabled             = var.zone_redundant

  tags = var.tags
}

# -
# - Create App Service
# -
resource "azurerm_windows_web_app" "this" {
  name                = "${var.name}-winapp"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = azurerm_service_plan.this.location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {}
}