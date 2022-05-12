// output "networking" {
//   value = module.network.*
// }

output "azurecaf-naming-objects" {
  value = tomap({
    shared  = module.azurecaf-shared.*,
    app     = module.azurecaf-app.*,
    data    = module.azurecaf-data.*,
    network = module.azurecaf-network.*,
  })
}

// output "storage" {
//   value = module.storage.*
// }

// output "keyvault" {
//   value = module.key-vault.*
// }
