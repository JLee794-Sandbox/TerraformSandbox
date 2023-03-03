azuread_group_id = "92c232f7-62e4-4b17-a155-24cf4d8392db"

# Global Settings for Naming Conventions
application_name = "shillingParts"
country_code     = "NA"
environment_code = "02"
# Location must be in the same region as the vnets for private endpoints
location = "eastus"
owner    = "someowner@domain.com"
tags = {
  Customer   = "FMC",
  DeployedBy = "Terraform"
}

# App Service Config Vars
appservice_plan_sku_name = "S2" # Defaults to S2

# App Service Config Vars
dotnet_version = "7.0" # Defaults to 7.0

# Network Config Vars
private_dns_fqdn                    = "test-dns.shillingparts.com"
virtual_network_name                = "staging-vnet"
virtual_network_resource_group_name = "validation-rg"
serverfarm_subnet_name              = "sp-serverfarm"
data_subnet_name                    = "sp-data"
devops_subnet_name                  = "devops"

# MS SQL Server Configuration Vars
administrator_login = "mssqladmin"
databases = {
  app_db = {
    name = "app_db"
    short_term_retention_policy = {
      retention_days = 7
    }
    long_term_retention_policy = {
      weekly_retention = "P1W"
      week_of_year     = 1
    }
  }
}
