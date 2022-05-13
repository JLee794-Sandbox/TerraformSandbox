# -
# - Get the current user config
# -
data "azurerm_client_config" "current" {}

locals {
  zone_redundant = var.sku_name != null ? ((substr(var.sku_name, 0, 2) == "BC" || substr(var.sku_name, 0, 1) == "P") ? true : false) : null

  activate_long_term_policy  = var.long_term_retention_policy == null ? [] : [true]
  activate_short_term_policy = var.short_term_retention_policy == null ? [] : [true]
}

# -
# - Azure SQL Databases
# -
resource "azurerm_mssql_database" "this" {
  name      = var.name
  server_id = var.server_id

  max_size_gb                 = var.max_size_gb
  sku_name                    = var.sku_name
  zone_redundant              = local.zone_redundant
  elastic_pool_id             = var.elastic_pool_id
  create_mode                 = var.create_mode
  creation_source_database_id = var.creation_source_database_id
  restore_point_in_time       = var.restore_point_in_time

  geo_backup_enabled   = var.geo_backup_enabled
  storage_account_type = var.storage_account_type

  dynamic "long_term_retention_policy" {
    for_each = local.activate_long_term_policy
    content {
      week_of_year      = tonumber(lookup(var.long_term_retention_policy, "week_of_year", null))
      weekly_retention  = lookup(var.long_term_retention_policy, "weekly_retention", null)
      monthly_retention = lookup(var.long_term_retention_policy, "monthly_retention", null)
      yearly_retention  = lookup(var.long_term_retention_policy, "yearly_retention", null)
    }
  }

  dynamic "short_term_retention_policy" {
    for_each = local.activate_short_term_policy
    content {
      retention_days           = tonumber(lookup(var.short_term_retention_policy, "retention_days", null))
      backup_interval_in_hours = (lookup(var.short_term_retention_policy, "backup_interval_in_hours", null) == null ? null : tonumber(lookup(var.short_term_retention_policy, "backup_interval_in_hours", null)))
    }
  }

  tags = merge({
    // Resource specific tags go here
    },
    var.tags
  )

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
