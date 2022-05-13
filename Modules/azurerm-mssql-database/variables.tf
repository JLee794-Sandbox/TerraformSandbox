variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default = {
    pe_enable = true
  }
}

# -
# - Azure SQL Database Required Parameters
# -
variable "server_id" {
  type        = string
  description = "The ID of the Azure SQL Server to create database within"
}

variable "name" {
  type        = string
  description = "Name of Azure SQL database"
}

# -
# - Optional Parameters
# -
variable "max_size_gb" {
  type        = number
  description = "The max size of the database in gigabytes"
  default     = 4
}

variable "sku_name" {
  type        = string
  description = "Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
  default     = null
}

variable "elastic_pool_id" {
  type        = string
  description = "Specifies the ID of the elastic pool containing this database."
  default     = null
}

variable "create_mode" {
  type        = string
  description = "The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup and Secondary."
  default     = null
}

variable "creation_source_database_id" {
  type        = string
  description = "The id of the source database to be referred to create the new database. This should only be used for databases with create_mode values that use another database as reference. Changing this forces a new resource to be created."
  default     = null
}

variable "restore_point_in_time" {
  type        = string
  description = "Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database. This property is only settable for create_mode= PointInTimeRestore databases."
  default     = null
}

variable "private_endpoint_connection_enabled" {
  type        = bool
  description = "Specify if only private endpoint connections will be allowed to access this resource"
  default     = true
}


variable "geo_backup_enabled" {
  type        = bool
  description = "Specifies whether to enable Geo Backup for the Azure SQL Server"
  default     = false
}

variable "storage_account_type" {
  type        = string
  description = "Specifies the storage account type to be used for the Azure SQL Server. Possible values are: Standard_LRS, Standard_ZRS, Premium_LRS, and Standard_GRS."
  default     = "Geo"

  validation {
    condition     = contains(["geo", "geozone", "local", "zone"], lower(var.storage_account_type))
    error_message = "Storage account type must be one of geo, geozone, local, zone."
  }
}

variable "long_term_retention_policy" {
  type = any
  // object({
  //   week_of_year      = number # Required
  //   weekly_retention  = string
  //   monthly_retention = string
  //   yearly_retention  = string
  // })
  description = "Specifies the long term retention policy for the Azure SQL Server"
  default     = null
}

variable "short_term_retention_policy" {
  type = any
  // object({
  //   retention_days           = number # Required
  //   backup_interval_in_hours = number # has to be within 12-24 hours
  // })
  description = "Specifies the short term retention policy for the Azure SQL Server"
  default     = null
}
