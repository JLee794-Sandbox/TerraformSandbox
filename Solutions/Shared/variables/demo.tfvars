# azuread_group_name = "jinle-spTFDemo"
azuread_group_id = "92c232f7-62e4-4b17-a155-24cf4d8392db"

# Global Settings for Naming Conventions
application_name = "schilling-devops"
country_code     = "NA"
environment_code = "02"
# Location must be in the same region as the vnets for private endpoints
location = "eastus"
owner    = "someowner@domain.com"
tags = {
  Customer   = "FMC",
  DeployedBy = "Terraform"
}

devops_vm_admin_username = "devopsAdmin"

# Network Config Vars
virtual_network_name                = "staging-vnet"
virtual_network_resource_group_name = "validation-rg"
devops_subnet_name                  = "devops"
