# -
# - Private DNS Zone Required Parameters
# -
variable "fqdn" {
  type        = string
  description = "(Required) Fully qualified domain name for the Private DNS Zone"
}

variable "resource_group_name" {
  type        = string
  description = "(Optional) The name of the resource group in which to create the MySQL Server"
}

variable "location" {
  type        = string
  description = "(Required) The location to deploy resources to."
}

# -
# - Optional Parameters
# -
variable "vnet_id" {
  type        = string
  description = "(Optional) The ID of the virtual network to associate the Private DNS Zone with. Either vnet_id or vnet_name must be specified."
  default     = ""
}

variable "vnet_name" {
  type        = string
  description = "(Optional) The Name of the virtual network to associate the Private DNS Zone with."
  default     = ""
}

variable "vnet_resource_group_name" {
  type        = string
  description = "(Optional) If the virtual network is in a different resource group, specify the name of the resource group here."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource"
  default = {
    pe_enable = true
  }
}
