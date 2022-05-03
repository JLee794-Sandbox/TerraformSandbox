#
# Shared Variables
# -----------------
variable "location" {
  description = "The location to create the network in"
  type        = string
  default     = "eastus2"
}

#
# Network Variables
# -----------------
variable "network_rg_name" {
  description = "The resource group name to create the network in"
  type        = string
  default     = "network-tf-rg"
}

variable "network_security_groups" {
  type = map(object({
    name                      = string
    tags                      = map(string)
    subnet_name               = string
    vnet_name                 = string
    networking_resource_group = string
    security_rules = list(object({
      name                                         = string
      description                                  = string
      protocol                                     = string
      direction                                    = string
      access                                       = string
      priority                                     = number
      source_address_prefix                        = string
      source_address_prefixes                      = list(string)
      destination_address_prefix                   = string
      destination_address_prefixes                 = list(string)
      source_port_range                            = string
      source_port_ranges                           = list(string)
      destination_port_range                       = string
      destination_port_ranges                      = list(string)
      source_application_security_group_names      = list(string)
      destination_application_security_group_names = list(string)
    }))
  }))
  description = "The network security groups with their properties."
  default     = {}
}


# Virtual Network
variable "virtual_networks" {
  description = "The virtal networks with their properties."
  type = map(object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
    ddos_protection_plan = object({
      id     = string
      enable = bool
    })
  }))
  default = {}
}

# Virtual Network Peering
variable "vnet_peering" {
  description = "Vnet Peering to the destination Vnet"
  type = map(object({
    destination_vnet_name        = string
    destination_vnet_rg          = string
    vnet_key                     = string
    allow_virtual_network_access = bool
    allow_forwarded_traffic      = bool
    allow_gateway_transit        = bool
    use_remote_gateways          = bool
  }))
  default = {}
}

# Subnets
variable "subnets" {
  description = "The virtal networks subnets with their properties."
  type = map(object({
    name              = string
    vnet_key          = string
    vnet_name         = string
    address_prefixes  = list(string)
    pe_enable         = bool
    service_endpoints = list(string)
    delegation = list(object({
      name = string
      service_delegation = list(object({
        name    = string
        actions = list(string)
      }))
    }))
  }))
  default = {}
}

#
# App Variables
# -----------------
variable "app_rg_name" {
  description = "The resource group name to create the app resources in"
  type        = string
  default     = "app-tf-rg"
}

# Storage Account
variable "storage_account_name" {
  description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string
}

variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}

variable "soft_delete_retention" {
  description = "Number of retention days for soft delete. If set to null it will disable soft delete all together."
  type        = number
  default     = 0
}

variable "containers" {
  description = "(Optional) List of containers to create and their access levels."
  type = list(object({
    name        = string
    access_type = string
  }))
  default = []
}

# Key Vault Vars
variable "key_vault_name" {
  type        = string
  description = "(Required) The name of the key vault to create"
}

variable "sku_name" {
  type        = string
  description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  #default     = "standard"
}

variable "access_policy" {
  description = "(Optional) A list of up to 16 objects describing access policies, as described below."
  type = list(object({
    object_id               = string
    certificate_permissions = list(string)
    key_permissions         = list(string)
    secret_permissions      = list(string)
  }))
  default = []
}

#
# Azure SQL Variables
# -----------------
variable "db_rg_name" {
  description = "The resource group name to create the app resources in"
  type        = string
  default     = "db-tf-rg"
}
