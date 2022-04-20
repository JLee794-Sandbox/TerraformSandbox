#
# Shared Variables
# -----------------
location = "eastus2"

#
# Network Variables
# -----------------
network_rg_name = "SP-PoC-Network"

# Virtual Network
virtual_networks = {
  virtualnetwork1 = {
    name                 = "sppoc-appvnet"
    address_space        = ["10.0.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  },
  virtualnetwork2 = {
    name                 = "sppoc-gatewayvnet"
    address_space        = ["172.16.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  }
}
# VNet Peering
vnet_peering = {
  GatewayToApp = {
    destination_vnet_name        = "sppoc-appvnet"
    destination_vnet_rg          = "SP-PoC-Network"
    vnet_key                     = "virtualnetwork2"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}

# Subnet
subnets = {
  subnet1 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #sppocvnetfirst
    name              = "loadbalancer"
    address_prefixes  = ["10.0.1.0/24"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.AzureCosmosDB"]
    pe_enable         = false
    delegation        = []
  },
  subnet2 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #sppocvnetfirst
    name              = "proxy"
    address_prefixes  = ["10.0.2.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet3 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #sppocvnetfirst
    name              = "application"
    address_prefixes  = ["10.0.3.0/24"]
    pe_enable         = false
    service_endpoints = ["Microsoft.Sql", "Microsoft.AzureCosmosDB"]
    delegation        = []
  },
  subnet4 = {
    vnet_key          = "virtualnetwork2"
    vnet_name         = null #sppocvnetsecond
    name              = "frontdoor"
    address_prefixes  = ["172.16.0.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  }
}

# Network Security Groups
network_security_groups = {
  nsg1 = {
    name                      = "nsg1"
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
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "*"
        source_address_prefixes                      = null
        destination_address_prefix                   = "*"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null # ["asg-src"]
        destination_application_security_group_names = null # ["asg-dest"]
      }
    ]
  }
}

#
# App Variables
# -----------------
app_rg_name = "SP-PoC-App"

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
