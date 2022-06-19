resource_group_name = "validation-rg"
azuread_administrator = {
  login_username = "AzureAD Admin"
  object_id      = "00000000-0000-0000-0000-000000000000"
}

name                                = "fmcsp-validation-server"
database_names                      = ["mydb001", "mydb002"]
administrator_login_name            = "dbadmin"
sku_name                            = "BC_Gen5_2"
azuresql_version                    = "12.0"
assign_identity                     = true
max_size_gb                         = 4
elastic_pool_id                     = null
create_mode                         = null
creation_source_database_id         = null
restore_point_in_time               = null
private_endpoint_connection_enabled = true
enable_failover_server              = false
failover_location                   = null
key_vault_name                      = null

tags = {
  iac          = "Terraform"
  env          = "uat"
  automated_by = ""
  pe_enable    = true
}
