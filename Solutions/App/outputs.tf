output "azurecaf-naming-objects" {
  value = tomap({
    shared  = module.azurecaf-shared.*,
    app     = module.azurecaf-app.*,
    data    = module.azurecaf-data.*,
    network = module.azurecaf-network.*,
  })
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

// output "appservice-linux-webapp" {
//   value = module.appservice-linux-webapp.*
// }


#
# Data Layer Outputs
# ---------------------------------------------------------
output "data-rg" {
  value = module.data-rg.*
}
output "data-mssql-server" {
  value = module.mssql-server.*
}
