variable "devops_vm_admin_username" {
  description = "[REQUIRED] Admin username to use for ssh access to the devops vm."
  type        = string
}

variable "client_config" {
  description = "(Optional) Client configuration object."
  default     = {}
}

variable "remote_objects" {
  description = "(Optional) Objects from other landing zones that are required for this deployment."
  default     = {}
}

variable "azuread_group_id" {
  description = "(Optional) The Azure AD Group ID to use for the App Service Plan"
  type        = string
  default     = null
}

variable "azuread_group_name" {
  description = "(Optional) Display Name of the AAD Security Group to own the deployed resources."
  type        = string
  default     = null
}

variable "devops_subnet_name" {
  description = "Name of the subnet the DevOps deployment vm will be deploying resources from"
  type        = string
}

variable "virtual_network_name" {
  description = "Resource Name for the existing VNet to use for this deployment"
  type        = string
}
variable "virtual_network_resource_group_name" {
  description = "Resource Group Name for the existing VNet to use for this deployment"
  type        = string
}


variable "tags" {
  description = "(Optional) Additional tags to apply to the resource."
  type        = map(any)
  default     = {}
}


#
# AzureCAF Naming Variables / Global Settings Config Vars
# --------------------------------------------------
# Variables to construct naming and tags based on established standards
#   Current naming convention example:
#    az-asp-NA02SCUS-JLeeParts-app
#     prefix = "az"
#     resource_type = "asp"
#     country_code = "NA"
#     environment_code = "02"
#     short_location = SCUS
#     application_name = "JLeeParts"
#     suffix = "app"

variable "application_name" {
  description = "(Required) Product/Application name which will be appended as a suffix."
  type        = string
}

variable "prefixes" {
  description = "(Optional) Prefixes to set for the resource names. Defaults to 'az'."
  type        = list(string)
  default     = ["az"]
}

variable "owner" {
  description = "(Required) Email or ID of the owner for the resource."
  type        = string
}

variable "country_code" {
  description = "(Required) Short country code to use for the name (eg. eu for europe, na for north america)"
  type        = string
  validation {
    condition     = contains(["na", "eu"], lower(var.country_code))
    error_message = "Currently only North America (NA) and Europe (EU) are supported."
  }
}

variable "environment_code" {
  description = "(Required) Numerical representation of the environment"
  type        = string
  validation {
    condition     = contains(["02", "03", "04"], var.environment_code)
    error_message = "Environment must be a number of 02 (nonprod), 03 (backup), or 04 (prod)."
  }
}

variable "location" {
  description = "(Required) location - example: South Central US = southcentralus"
  type        = string
  validation {
    condition     = contains(["eastus", "eastus2", "southcentralus", "westus"], lower(var.location))
    error_message = "Location must be one of the following: eastus, eastus2, southcentralus, westus."
  }
}
