# ============================================================= #
# This file is a TEMPLATE to show-case input parameters
#  and how they look being provided for a fresh deployment
#
# Move this file to the same directory where the main Terraform
#  deployment files are located (/Solutions/App), and rename to
#  "terraform.tfvars"
#
# You can also leverage this file without moving/renaming by:
#
#    terraform plan -var-file=<path-to-this-file>/uat.tfvars
#
# ============================================================= #

#
# Shared Layer Variables
# ======================
# These variables are primarily responsible
#   for constructing the naming convention
#   via the azurecaf-name module
# -----------------
country_code     = "NA"
environment_code = "02"
application_name = "myApp"
prefix           = "az"
location         = "eastus2"
owner            = "someowner@domain.com"

# Additional tags to apply (azurecaf-name module will also generate
#  tags per the policy requirements found in /Modules/azurecaf-naming/main.tf)
tags = {
  Provisioner = "Terraform"
}

#
# Data Layer Variables
# ===================
# To leverage the AAD auth on MS SQL Servers, we need to provide
#   the AAD object_id of the user or group we want to grant admin
#   privileges to manage the server.
# -----------------
azuread_administrator = {
  login_username = "AzureAD Admin" # Can be any alphanumeric name
  object_id      = "00000000-0000-0000-0000-000000000000"
}


#
# Network Layer Variables
# ======================
# This project operates under the assumption of a pre-existing network
#  that will be managed by a separate team/workflow. Therefore, please
#  provide the existing resource IDs.
# -----------------
vnet_id   = ""
subnet_id = ""

#
# App Layer Variables
# -----------------
# Storage Account
account_tier = "Standard"
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

# Network Security Groups
# ======================
# network_security_group variable is a list of dictionaries.
# Each dictionary contains another list of dictionaries that
#  specify the security rules to assign to the NSG resource
# ----------------------
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
