
# -
# - Log Analytics Workspace Required Parameters
# -
variable "name" {
  type        = string
  description = "(Required) The name of the App Service"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Log Analytics Workspace"
}

variable "location" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Log Analytics Workspace"
}

# -
# - Optional Parameters
# -
variable "sku" {
  type        = string
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018."
  default     = "PerGB2018"
}
variable "retention_in_days" {
  type        = number
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  default     = null
}

variable "daily_quota_gb" {
  type        = number
  description = "(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  default     = -1
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource"
  default     = {}
}
