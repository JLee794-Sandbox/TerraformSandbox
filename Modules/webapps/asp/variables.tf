

variable "tags" {
  description = "(Required) map of tags for the deployment"
}

variable "app_service_environment_id" {
  description = "(Optional) ASE Id for App Service Plan Hosting Environment, defaults to null"
  default     = null
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group where to create the resource."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}

variable "settings" {}

variable "os_type" {
  description = "(Optional) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer. Changing this forces a new resource to be created."
  default     = "Linux"
}

variable "global_settings" {
  description = "Global settings object (see module README.md)"
}

variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}
