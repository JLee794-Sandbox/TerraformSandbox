#
# Required Parameters
# --------------------------------------------------
variable "name" {
  description = "(Required) Specifies the name of the private link service. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure Region where the Load Balancer should be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the private link service. Changing this forces a new resource to be created."
  type        = string
}

variable "frontend_ip_configurations" {
  description = "(Required) A list of Frontend IP Configuration ID's from a Standard Load Balancer, where traffic from the Private Link Service should be routed. You can use Load Balancer Rules to direct this traffic to appropriate backend pools where your applications are running."
  type        = map(any)
}


#
# Optional Parameters
# --------------------------------------------------
variable "sku" {
  description = "(Optional) The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic."
  type        = string
  default     = "Basic"
}

variable "sku_tier" {
  description = "(Optional) The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional. Changing this forces a new resource to be created."
  type        = string
  default     = "Regional"
}

variable "tags" {
  description = "(Optional) Specifies the tags to assign to the resource. Changing this forces a new resource to be created."
  type        = map(string)
  default     = null
}
