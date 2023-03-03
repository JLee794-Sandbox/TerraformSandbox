data "azurerm_client_config" "current" {}

data "azuread_group" "admins" {
  count            = var.azuread_group_id == null ? 1 : 0
  display_name     = var.azuread_group_name
  security_enabled = true
}

data "azurerm_virtual_network" "app_vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_resource_group_name
}

data "azurerm_subnet" "serverfarm" {
  name                 = var.serverfarm_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_resource_group_name
}

data "azurerm_subnet" "data" {
  name                 = var.data_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_resource_group_name
}

data "azurerm_subnet" "devops" {
  name                 = var.devops_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_resource_group_name
}

data "http" "ip" {
  url = "https://ifconfig.me/ip"
}


# data "azurerm_storage_account_sas" "app_logs" {
#   connection_string = module.storage_account.primary_connection_string
#   https_only        = true
#   signed_version    = "2021-06-08"

#   resource_types {
#     service   = false
#     container = true
#     object    = false
#   }

#   services {
#     blob  = true
#     queue = false
#     table = false
#     file  = false
#   }

#   start  = formatdate("YYYY-MM-01'T'00:00:00Z", timestamp())
#   expiry = timeadd(formatdate("YYYY-MM-01'T'00:00:00Z", timestamp()), var.application_log_sas_url_expiry_in_hours)

#   permissions {
#     read    = true
#     write   = true
#     delete  = true
#     list    = true
#     add     = false
#     create  = false
#     update  = false
#     process = false
#     tag     = false
#     filter  = false
#   }
# }

# output "sas_url_query_string" {
#   value = data.azurerm_storage_account_sas.app_logs.sas
#   sensitive = true
# }
