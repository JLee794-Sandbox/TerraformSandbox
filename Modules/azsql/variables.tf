variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the MySQL Server"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default = {
    pe_enable = true
  }
}

# -
# - Azure SQL Server
# -
variable "server_name" {
  type        = string
  description = "The name of the Azure SQL Server"
  default     = null
}

variable "database_names" {
  type        = list(string)
  description = "List of Azure SQL database names"
  default     = []
}

variable "administrator_login_name" {
  type        = string
  description = "The administrator username of Azure SQL Server"
  default     = "dbadmin"
}

variable "administrator_login_password" {
  type        = string
  description = "The administrator password of the Azure SQL Server"
  default     = null
}

variable "azuresql_version" {
  type        = string
  description = "Specifies the version of Azure SQL Server ti use. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
  default     = "12.0"
}

variable "assign_identity" {
  type        = bool
  description = "Specifies whether to enable Managed System Identity for the Azure SQL Server"
  default     = true
}

variable "minimum_tls_version" {
  type        = string
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2."
  default     = "1.2"
}

variable "max_size_gb" {
  type        = number
  description = "The max size of the database in gigabytes"
  default     = 4
}

variable "sku_name" {
  type        = string
  description = "Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
  default     = "BC_Gen5_2"
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


variable "key_vault_name" {
  type        = string
  description = "Specifies the existing Key Vault Name where you want to store AZ Sql Server Password and CMK Key."
  default     = null
}
