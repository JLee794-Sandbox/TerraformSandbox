output "azurecaf-name" {
  value = module.azurecaf-app.*
}

#
# Application Layer Outputs
# ---------------------------------------------------------
output "app-rg" {
  value = module.app-rg.*
}

output "appservice-plan" {
  value = module.appservice-plan.*
}

output "appservice-linux-webapp" {
  value     = module.linux-webapp.*
  sensitive = true
}

output "appservice-linux-webapp-identity" {
  value = module.linux-webapp.identity
}

#
# Data Layer Outputs
# ---------------------------------------------------------
output "data-mssql-server" {
  value = module.mssql-server.*
}
