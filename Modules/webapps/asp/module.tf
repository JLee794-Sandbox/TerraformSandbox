
resource "azurecaf_name" "plan" {
  name          = var.settings.name
  resource_type = "azurerm_app_service_plan"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}


resource "azurerm_service_plan" "asp" {
  name                         = azurecaf_name.plan.result
  location                     = var.location
  resource_group_name          = var.resource_group_name
  os_type                      = var.os_type
  maximum_elastic_worker_count = lookup(var.settings, "maximum_elastic_worker_count", null)
  worker_count                 = lookup(var.settings, "worker_count", null)

  per_site_scaling_enabled = lookup(var.settings, "per_site_scaling_enabled", false)

  # is_xenon is No longer a valid attribute starting with azurerm v3.0+
  ## is_xenon         = lookup(var.settings, "is_xenon", null)

  sku_name = var.settings.sku_name

  # sku {
  #   tier     = var.settings.sku.tier
  #   size     = var.settings.sku.size
  #   capacity = lookup(var.settings.sku, "capacity", null)
  # }

  app_service_environment_id = var.app_service_environment_id

  # zone_redundant is now zone_balancing_enabled starting with azurerm v3.0+
  ## zone_redundant             = lookup(var.settings, "zone_redundant", null)
  zone_balancing_enabled = lookup(var.settings, "zone_redundant", null)
  tags                   = local.tags

  timeouts {
    create = "5h"
    update = "5h"
  }

  # ASE is now supported in azurerm v3.0+
  ## lifecycle {
  ##   # TEMP until native tf provider for ASE ready to avoid force replacement of asp on every ase changes
  ##   ignore_changes = [app_service_environment_id]
  ## }
}
