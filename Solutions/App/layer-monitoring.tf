#
# Monitoring-layer resources
# ------------------------------------------------------------
module "monitor-rg" {
  source = "../../Modules/azurerm-resourcegroup"

  name     = module.azurecaf-monitor.results["azurerm_resource_group"]
  location = module.azurecaf-monitor.location

  tags = module.azurecaf-app.tags
}

# module "log-analytics-workspace" {
#   source = "../../Modules/azurerm-log-analytics-workspace"

#   resource_group_name = module.monitor-rg.name
#   location            = module.monitor-rg.location

#   name = module.azurecaf-monitor.results["azurerm_log_analytics_workspace"]

#   sku = "PerGB2018"

#   daily_quota_gb    = -1
#   retention_in_days = 30

#   tags = module.azurecaf-app.tags
# }
