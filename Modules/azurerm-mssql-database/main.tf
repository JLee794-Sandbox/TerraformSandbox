data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# -
# - Get the current user config
# -
data "azurerm_client_config" "current" {}

locals {
  zone_redundant = var.sku_name != null ? ((substr(var.sku_name, 0, 2) == "BC" || substr(var.sku_name, 0, 1) == "P") ? true : false) : null

  long_term_retention_policy  = var.long_term_retention_policy == {} ? [] : [var.long_term_retention_policy]
  short_term_retention_policy = var.short_term_retention_policy == {} ? [] : [var.short_term_retention_policy]
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
    for_each = local.long_term_retention_policy
    content {
      weekly_retention  = long_term_retention_policy.value.weekly_retention
      monthly_retention = long_term_retention_policy.value.monthly_retention
      yearly_retention  = long_term_retention_policy.value.yearly_retention
      week_of_year      = long_term_retention_policy.value.week_of_year
    }
  }

  dynamic "short_term_retention_policy" {
    for_each = local.short_term_retention_policy
    content {
      retention_days           = short_term_retention_policy.value.retention_days
      backup_interval_in_hours = short_term_retention_policy.value.backup_interval_in_hours
    }
  }

  tags = merge({
    // Additional tags go here
    },
    var.tags
  )

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
