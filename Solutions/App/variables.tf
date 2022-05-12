#
# Shared Variables
# -----------------

variable "resource_types" {
  type = list(string)
  description = "(Optional) - a list of additional resource type should you want to use the same settings for a set of resources"
  default = []
}

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
    condition = contains(["na", "eu"], lower(var.country_code))
    error_message = "Currently only North America (NA) and Europe (EU) are supported."
  }
}

variable "environment_code" {
  description = "(Required) Numerical representation of the environment"
  type        = string
  validation {
    condition = contains(["02", "03", "04"], var.environment_code)
    error_message = "Environment must be a number of 02 (dev), 03 (test), or 04 (prod)."
  }
}

variable "location" {
  description = "(Required) location - example: South Central US = southcentralus"
  type        = string
  validation {
    condition = contains(["eastus", "eastus2", "southcentralus", "westus"], lower(var.location))
    error_message = "Location must be one of the following: eastus, eastus2, southcentralus, westus."
  }
}

#
# App Variables
# -----------------
variable "app_rg_name" {
  description = "The resource group name to create the app resources in"
  type        = string
  default     = "app-tf-rg"
}

# Storage Account
variable "storage_account_name" {
  description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string
}

variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}

variable "soft_delete_retention" {
  description = "Number of retention days for soft delete. If set to null it will disable soft delete all together."
  type        = number
  default     = 0
}

variable "containers" {
  description = "(Optional) List of containers to create and their access levels."
  type = list(object({
    name        = string
    access_type = string
  }))
  default = []
}

# Key Vault Vars
variable "key_vault_name" {
  type        = string
  description = "(Required) The name of the key vault to create"
}

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
# Azure SQL Variables
# -----------------
variable "db_rg_name" {
  description = "The resource group name to create the app resources in"
  type        = string
  default     = "db-tf-rg"
}
