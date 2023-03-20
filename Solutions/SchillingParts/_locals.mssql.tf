locals {
  ###############################
  # MSSQL Server Configuration
  ###############################
  mssql_server_settings = {
    name                  = local.deploymentName
    administrator_login   = var.administrator_login
    azuread_administrator = {}
    # azuread_administrator = {
    #   login_username = data.azuread_user.app_aad_user.user_principal_name
    #   tenant_id = data.azurerm_client_config.current.tenant_id
    #   object_id = data.azuread_user.app_aad_user.object_id
    # }

    version                       = "12.0" # Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)
    public_network_access_enabled = false
  }

  ###############################
  # MSSQL Database Configuration
  ###############################
  mssql_databases_settings = {
    data = {
      name           = "data"
      collation      = "SQL_Latin1_General_CP1_CI_AS"
      max_size_gb    = 100
      zone_redundant = false
    }
    # logs = {
    #   name           = "logs"
    #   collation      = "SQL_Latin1_General_CP1_CI_AS"
    #   max_size_gb    = 100
    #   zone_redundant = false
    # }
  }

  ###############################
  # MSSQL Private Endpoint Configuration
  ###############################
  mssql_pep_settings = {
    data = {
      name               = "mssql"
      resource_group_key = "app_rg"
      name               = "mssql-${local.deploymentName}"
      subnet_id          = data.azurerm_subnet.data.id

      private_dns = {
        mssql = {
          zone_group_name = "mssql"
          ids             = [module.private_dns.id]
        }
      }
      private_service_connection = {
        name                 = "appsvc-sa-logs-${local.deploymentName}"
        is_manual_connection = false
        subresource_names    = ["sqlServer"]

      }
    }
  }
}
