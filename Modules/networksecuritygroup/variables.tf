variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the NSGs."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

# -
# - Network Security Group object
# -
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

#
# Optional Parameters
# --------------------------------------------------
variable "additional_tags" {
  description = "(Optional) Additional tags to associate to each nsg created."
  type        = map(string)
  default     = {}
}
