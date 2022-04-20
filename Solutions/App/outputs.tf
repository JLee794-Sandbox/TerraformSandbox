output "networking" {
  value = module.network.*
}

output "storage" {
  value = module.storage.*
}

output "keyvault" {
  value = module.key-vault.*
}
