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
variable "app_settings" {
  type        = map(string)
  description = "(Optional) A map of App Settings to set on the App Service."
  default     = {}
}

variable "site_config" {
  type        = map(string)
  description = "(Optional) A map of App Settings to set on the App Service."
  default     = {}
}


variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource"
  default     = {}
}

variable "workspace_id" {
  type        = string
  description = "(Optional) Specifies the id of a log analytics workspace resource"
  default     = null
}


variable "identity_type" {
  type        = string
  description = "(Optional) The type of identity to use for the Azure App Service. Valid values are: SystemAssigned"
  default     = "SystemAssigned"
}

variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Managed Identity IDs to be assigned to this Linux Web App."
  default     = []
}
variable "subnet_id" {
  description = "(Optional) Subnet for VNet integration. Defaults to null"
  type        = string
  default     = null
}
