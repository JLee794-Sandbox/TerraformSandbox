output "storage_account_name" {
  value = module.storage_account.name
}

output "linux_webapp" {
  value = module.linux_webapp
}

output "appservice_plan" {
  value = module.appservice_plan
}

output "keyvault_name" {
  value = module.keyvault.name
}

output "mssql_server" {
  value = module.mssql_server
}

output "mssql_dbs" {
  value = module.mssql_dbs
}

output "frontdoor" {
  value = module.frontdoor
}

output "private_dns" {
  value = module.private_dns
}

output "mssql_private_endpoint" {
  value = module.mssql_private_endpoint
}

# output "storage_private_endpoint" {
#   value = module.storage_private_endpoint
# }
