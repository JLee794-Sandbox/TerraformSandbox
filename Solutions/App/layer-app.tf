#
# Application-layer resources
# - app service plan, app service, app service deployment, app service slot
# ------------------------------------------------------------
module "app-rg" {
  source = "../../Modules/azurerm-resourcegroup"

  name     = module.azurecaf-app.results["azurerm_resource_group"]
  location = module.azurecaf-app.location

  tags = module.azurecaf-app.tags
}

module "appservice-plan" {
  source = "../../Modules/azurerm-appservice-plan"

  name = module.azurecaf-app.results["azurerm_app_service_plan"]

  resource_group_name = module.app-rg.name
  location            = module.app-rg.location

  sku_name = "S2"
  os_type  = "Linux"

  worker_count             = null
  per_site_scaling_enabled = false
  zone_balancing_enabled   = false

  tags = module.azurecaf-app.tags

}

module "linux-webapp" {
  source = "../../Modules/azurerm-appservice-linux-webapp"

  name = module.azurecaf-app.results["azurerm_app_service"]

  resource_group_name = module.app-rg.name
  location            = module.app-rg.location
  service_plan_id     = module.appservice-plan.id

  tags = module.azurecaf-app.tags
}
