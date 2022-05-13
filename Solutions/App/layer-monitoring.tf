#
# Monitoring-layer resources
# ------------------------------------------------------------
module "monitor-rg" {
  source = "../../Modules/azurerm-resourcegroup"

  name     = module.azurecaf-monitor.results["azurerm_resource_group"]
  location = module.azurecaf-monitor.location

  tags = module.azurecaf-app.tags
}
