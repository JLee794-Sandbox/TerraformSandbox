#
# Data resources
# ------------------------------------------------------------
module "mssql-server" {
  source = "../../Modules/azurerm-mssql-server"

  name                = module.azurecaf-data.results["azurerm_mssql_server"]
  resource_group_name = module.app-rg.name
  location            = module.app-rg.location

  # Create a managed identity for the Azure SQL Server
  identity_type         = var.identity_type
  azuread_administrator = var.azuread_administrator

  tags = module.azurecaf-data.tags
}

#
# Databases
# TODO: Refine db configuration
# TODO: Parameterize hardcoded values
module "mssql-server-database-short-term-policy" {
  source = "../../Modules/azurerm-mssql-database"

  name               = "${module.azurecaf-data.results["azurerm_mssql_database"]}-stp"
  server_id          = module.mssql-server.id
  geo_backup_enabled = true

  short_term_retention_policy = {
    retention_days           = 7
    backup_interval_in_hours = 24
  }

  tags = module.azurecaf-data.tags
}

module "mssql-server-database-long-term-policy" {
  source = "../../Modules/azurerm-mssql-database"

  name               = "${module.azurecaf-data.results["azurerm_mssql_database"]}-ltp"
  server_id          = module.mssql-server.id
  geo_backup_enabled = false
  long_term_retention_policy = {
    week_of_year     = 1
    weekly_retention = "P7D" # Optional
    // monthly_retention = "P30D" # Optional
    // yearly_retention = "P365D" # Optional
  }

  tags = module.azurecaf-data.tags
}

module "mssql-server-database-both-term-policy" {
  source = "../../Modules/azurerm-mssql-database"

  name               = "${module.azurecaf-data.results["azurerm_mssql_database"]}-btp"
  server_id          = module.mssql-server.id
  geo_backup_enabled = false

  short_term_retention_policy = {
    retention_days = 7
    // backup_interval_in_hours = 24 # Optional
  }

  long_term_retention_policy = {
    week_of_year     = 1
    weekly_retention = "P7D" # Optional
    // monthly_retention = "P30D" # Optional
    // yearly_retention = "P365D" # Optional
  }

  tags = module.azurecaf-data.tags
}
