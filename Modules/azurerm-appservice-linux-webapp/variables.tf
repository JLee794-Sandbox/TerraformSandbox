variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the App Service Environment and Plan"
}

variable "location" {
  type        = string
  description = "(Required) The location to deploy resources to."
}

variable "service_plan_id" {
  type        = string
  description = "(Required) The ID of the App Service Plan to deploy the linux application to"
}

# -
# - Linux Web App Required Parameters
# -
variable "name" {
  type        = string
  description = "(Required) The name of the App Service"
}

# -
# - Optional Parameters
# -
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource"
  default     = {}
}