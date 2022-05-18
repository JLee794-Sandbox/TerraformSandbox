#
# AzureCAF Naming Variables
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
    condition     = contains(["02", "01", "03"], var.environment_code)
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

#
# Shared Layer Variables
# - key vault, storage account
# ---------------------------------------------
# Storage Account
variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}

variable "containers" {
  description = "(Optional) List of containers to create and their access levels."
  type = list(object({
    name        = string
    access_type = string
  }))
  default = []
}

# Key Vault
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
# App Layer Variables
# - app service plan, app service, app service deployment, app service slot
# ---------------------------------------------

#
# Data Layer Variables
# - storage account, mssql server, mssql database, mssql firewall rule (tbd)
# ---------------------------------------------

#
# Monitoring Layer Variables
# - application insights (tbd), application insights workspace (tbd)
# ---------------------------------------------

#
# Network Layer Variables
# - network security group, front door, front door waf policies (tbd)
# ---------------------------------------------
variable "network_security_groups" {
  description = "A map of objects of network security groups to apply to the resource."
  type        = map(any)
  default     = {}
}
// variable "soft_delete_retention" {
//   description = "Number of retention days for soft delete. If set to null it will disable soft delete all together."
//   type        = number
//   default     = 0
// }
