#
# Required Parameters
# --------------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group in which the Front Door service should exist. Changing this forces a new resource to be created."
}


# -
# - FrontDoor WAF Parameters
# -
variable "front-door-waf-object" {
  description = "(Required) AFD Settings of the Azure Front Door to be created"
}

# -
# - FrontDoor Parameters
# -
variable "front-door-object" {
  description = "(Required) Front Door Object configuration"
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Map of key value pairs for the resource tagging. Default: none."
  default     = {}
}
