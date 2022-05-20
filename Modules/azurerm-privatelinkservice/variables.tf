#
# Required Parameters
# --------------------------------------------------
variable "name" {
  description = "(Required) Specifies the name of the private link service. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure Region where the Private Link Service should be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the private link service. Changing this forces a new resource to be created."
  type        = string
}

variable "load_balancer_frontend_ip_configuration_ids" {
  description = "(Required) A list of Frontend IP Configuration ID's from a Standard Load Balancer, where traffic from the Private Link Service should be routed. You can use Load Balancer Rules to direct this traffic to appropriate backend pools where your applications are running."
  type        = list(string)
}

variable "nat_ip_configurations" {
  description = "(Required) One or more (up to 8) nat_ip_configuration block as defined below."
  type        = map(any)
}

#
# Optional Parameters
# --------------------------------------------------
variable "visibility_subscription_ids" {
  description = "(Optional) A list of Subscription UUID/GUID's that will be able to see this Private Link Service."
  type        = list(string)
  default     = []
}

variable "auto_approval_subscription_ids" {
  description = "(Optional) A list of Subscription UUID/GUID's that will be automatically be able to use this Private Link Service."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "(Optional) Specifies the tags to assign to the resource. Changing this forces a new resource to be created."
  type        = map(string)
  default     = null
}
