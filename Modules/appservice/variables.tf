variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the App Service Environment and Plan"
}

variable "virtual_network_name" {
  type        = string
  description = "(Required) The name of the virtual network in which to associate the App Service Environment"
}

variable "subnet_name" {
  type        = string
  description = "(Required) The name of the subnet in which to associate the App Service Environment"
}


# -
# - App Service Environment and Plan variables
# -
variable "name" {
  type        = string
  description = "(Required) The name of the App Service"
}

variable "sku_name" {
  type        = string
  description = "(Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, FREE, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, and WS3."
  validation { 
    condition = contains(["I1", "I2", "I3", "I1v2", "I2v2", "I3v2"], var.sku_name)
    error_message = "The sku_name must be one of I1, I2, I3, I1v2, I2v2, or I3v2."
  }
}

variable "os_type" {
  type        = string
  description = "(Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer."
  validation {
    condition = contains(["Windows", "Linux", "WindowsContainer"], var.os_type)
    error_message = "The os_type must be one of Windows, Linux, or WindowsContainer."
  }
}

variable "maximum_elastic_worker_count" {
  type        = number
  description = "(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU."
  default = null
}

variable "worker_count" {
  type        = number
  description = "(Optional) The number of Workers (instances) to be allocated."
  default = null
}

variable "zone_redundant" {
  type        = bool
  description = "(Optional) Whether the App Service Environment should be zone redundant"
  default     = false
}

variable "internal_load_balancing_mode" {
  type        = string
  description = "(Optional) The internal load balancing mode of the App Service Environment"
  default     = "None"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource"
  default = {
    pe_enable = true
  }
}