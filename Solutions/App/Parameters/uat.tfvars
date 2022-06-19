#
# Shared Layer Variables
# -----------------
country_code     = "NA"
environment_code = "02"
application_name = "myApp"
prefix           = "az"
location         = "eastus2"
owner            = "someowner@domain.com"

tags = {
  Provisioner = "Terraform"
}

#
# Network Layer Variables
# -----------------
vnet_id   = ""
subnet_id = ""

#
# App Layer Variables
# -----------------
# Storage Account
storage_account_name = "sppocstorage321"
account_tier         = "Standard"
containers = [
  {
    "name" : "container1",
    "access_type" : "private"
  },
  {
    "name" : "container2",
    "access_type" : "private"
  }
]
soft_delete_retention = 0

# Key Vault
key_vault_name = "sppockeyvault"
sku_name       = "standard"

# Network Security Groups
network_security_groups = {
  nsg1 = {
    name                      = "Internet-to-Frontdoor"
    tags                      = { log_workspace = "sandbox-law" }
    subnet_name               = "loadbalancer"
    vnet_name                 = null
    networking_resource_group = null
    security_rules = [
      {
        name                                         = "nsg"
        description                                  = "NSG"
        priority                                     = 101
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "443"
        destination_port_ranges                      = null
        source_address_prefix                        = "Internet"
        source_address_prefixes                      = null
        destination_address_prefix                   = "VirtualNetwork"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null # ["asg-src"]
        destination_application_security_group_names = null # ["asg-dest"]
      }
    ]
  }
}

# Frontdoor

#
# Monitoring Layer Variables
# -----------------

#
# Data Layer Variables
# -----------------
# Create a managed identity for the Azure SQL Server
identity_type = "SystemAssigned"

azuread_administrator = {
  login_username = "AzureAD Admin"
  object_id      = "00000000-0000-0000-0000-000000000000"
}
