# -
# - Azure SQL Server Required Parameters
# -
variable "name" {
  type        = string
  description = "(Required) The name of the Azure SQL Server"
}

variable "resource_group_name" {
  type        = string
  description = "(Optional) The name of the resource group in which to create the MySQL Server"
}

variable "location" {
  type        = string
  description = "(Required) The location to deploy resources to."
}

# -
# - Optional Parameters
# -
variable "administrator_login_name" {
  type        = string
  description = "(Optional) The administrator username of Azure SQL Server"
  default     = "dbadmin"
}

variable "administrator_login_password" {
  type        = string
  description = "(Optional) The administrator password of the Azure SQL Server"
  default     = null
}

variable "mssql_version" {
  type        = string
  description = "(Optional) Specifies the version of Azure SQL Server ti use. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
  default     = "12.0"
}

variable "identity_type" {
  type        = string
  description = "(Optional) The type of identity to use for the Azure SQL Server. Valid values are: SystemAssigned, UserAssigned, None"
  default     = "SystemAssigned"
}

variable "identity_ids" {
  type        = list(string)
  description = "(Optional) The identity IDs to use for the Azure SQL Server. Valid values are: SystemAssigned, UserAssigned, None"
  default     = []
}

variable "azuread_administrator" {
  type        = map(any)
  description = "(Optional) Map of AAD attributes to manage the MSSQL server with"
  default     = {}
}

variable "minimum_tls_version" {
  type        = string
  description = "(Optional) The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2."
  default     = "1.2"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) (Optional) Whether public network access is allowed for this server. Defaults to true."
  default     = true
}

variable "key_vault_id" {
  type        = string
  description = "(Optional) Specifies the existing Key Vault ID where you want to store AZ Sql Server Password and CMK Key."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource"
  default = {
    pe_enable = true
  }
}
