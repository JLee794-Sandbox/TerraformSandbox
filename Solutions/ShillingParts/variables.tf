variable "client_config" {
  description = "(Optional) Client configuration object."
  type        = map(any)
  default     = {}
}

variable "remote_objects" {
  description = "(Optional) Objects from other landing zones that are required for this deployment."
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

variable "tags" {
  description = "(Optional) Additional tags to apply to the resource."
  type        = map(any)
  default     = {}
}

#
# App Layer Variables
# - app service plan, app service, app service deployment, app service slot
# ---------------------------------------------
variable "appservice_plan_sku_name" {
  type        = string
  description = "(Required) The Name of the SKU for the App Service Plan. Possible values  include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1."
  default     = "S2"
  validation {
    condition     = contains(["B1", "B2", "B3", "D1", "F1", "I1", "I2", "I3", "I1v2", "I2v2", "I3v2", "P1v2", "P2v2", "P3v2", "P1v3", "P2v3", "P3v3", "S1", "S2", "S3", "SHARED", "EP1", "EP2", "EP3", "WS1", "WS2", "WS3", "Y1"], var.appservice_plan_sku_name)
    error_message = "The SKU Name must be one of the following: B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1."
  }
}

variable "application_log_level" {
  type        = string
  description = "(Optional) The level of logging to enable for the App Service. Possible values are Information, Warning, Error, and Verbose. Defaults to Error."
  default     = "Error"
  validation {
    condition     = contains(["Information", "Warning", "Error", "Verbose"], var.application_log_level)
    error_message = "The Application Log Level must be one of the following: Information, Warning, Error, and Verbose."
  }
}

variable "application_fs_level" {
  type        = string
  description = "(Optional) The level of FILESYSTEM logging to enable for the App Service. Possible values are Information, Warning, Error, and Verbose. Defaults to Error."
  default     = "Error"
  validation {
    condition     = contains(["Information", "Warning", "Error", "Verbose"], var.application_fs_level)
    error_message = "The Application File System Level must be one of the following: Off, Information, Warning, Error, and Verbose."
  }

}

variable "application_log_retention_in_days" {
  description = "(Optional) Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90."
  default     = 90
  type        = number

  validation {
    condition     = contains([30, 60, 90, 120, 180, 270, 365, 550, 730], var.application_log_retention_in_days)
    error_message = "Provide a valid value for retention period in days."
  }
}

variable "application_log_sas_url_expiry_in_hours" {
  type        = string
  description = "(Optional) The SAS URL Expiry in Hours for the Application Log (max 8640h). Defaults to 24h."
  default     = "24h"
  validation {
    condition     = can(regex("^([0-9]+h)$", var.application_log_sas_url_expiry_in_hours))
    error_message = "The Application Log SAS URL Expiry must be a number of hours (max 8640h)."
  }
}

variable "dotnet_version" {
  type        = string
  description = "(Optional) The version of .NET to use. Possible values include 3.1, 5.0, 6.0 and 7.0."
  default     = null
  validation {
    condition     = var.dotnet_version == null ? true : contains(["3.1", "5.0", "6.0", "7.0"], var.dotnet_version)
    error_message = "The .NET version must be one of the following: 3.1, 5.0, 6.0 and 7.0."
  }
}

variable "docker_image" {
  type        = string
  description = "(Optional) The Docker image to use for the App Service."
  default     = null
}

variable "docker_image_tag" {
  type        = string
  description = "(Optional) The Image Tag to use for the Docker image."
  default     = null
}

variable "java_server" {
  type        = string
  description = "(Optional) The Java Server to use for the App Service. Possible values include Tomcat and Jetty."
  default     = null
  validation {
    condition     = var.java_server == null ? true : contains(["JAVA", "TOMCAT", "JBOSSEAP"], var.java_server)
    error_message = "The Java Server must be one of the following: JAVA, TOMCAT and JBOSSEAP."
  }
}

variable "java_version" {
  type        = string
  description = "(Optional) The Version of Java to use. Possible values include 8, 11, and 17."
  default     = null
  validation {
    condition     = var.java_version == null ? true : contains(["8", "11", "17"], var.java_version)
    error_message = "The Java Server Version must be one of the following: 8, 11, and 17."
  }
}

#
# Shared Layer Variables
# - key vault, storage account
# ---------------------------------------------
# Storage Account
# variable "account_tier" {
#   description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
#   type        = string
# }

# variable "storage_containers" {
#   description = "(Optional) Map of containers to create and their access levels."
#   type = map(object({
#     name        = string
#     container_access_type = string
#   }))
#   default = {}
# }

# # Key Vault
# variable "sku_name" {
#   type        = string
#   description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
#   default     = "standard"
# }

# variable "access_policy" {
#   description = "(Optional) A list of up to 16 objects describing access policies, as described below."
#   type = list(object({
#     object_id               = string
#     certificate_permissions = list(string)
#     key_permissions         = list(string)
#     secret_permissions      = list(string)
#   }))
#   default = []
# }


# #
# # Data Layer Variables
# # - storage account, mssql server, mssql database, mssql firewall rule (tbd)
# # ---------------------------------------------
# variable "identity_type" {
#   type        = string
#   description = "(Optional) The type of identity to use for the resource. Possible values are SystemAssigned, UserAssigned, None. Defaults to None."
#   default     = ""
# }
# variable "identity_ids" {
#   type        = set(string)
#   description = "(Optional) The identity IDs to use for the Azure SQL Server. Valid values are: SystemAssigned, UserAssigned, None"
#   default     = []
# }

variable "administrator_login" {
  type        = string
  description = "(Required) administrator login for the server. Changing this forces a new resource to be created."
}

variable "databases" {
  description = "(Optional) Map of databases to create on the server."
  default     = {}
}


# #
# # Monitoring Layer Variables
# # - application insights (tbd), application insights workspace (tbd)
# # ---------------------------------------------

# #
# # Network Layer Variables
# # - network security group, front door, front door waf policies (tbd)
# # ---------------------------------------------
# variable "network_security_groups" {
#   description = "A map of objects of network security groups to apply to the resource."
#   type        = map(any)
#   default     = {}
# }
variable "private_dns_fqdn" {
  description = "The FQDN of the private DNS zone to use for the App Service Plan"
  type        = string
}
variable "serverfarm_subnet_name" {
  description = "Name of the subnet with the serverfarm designation to host the App Service Plan private networking resources"
  type        = string
}

variable "data_subnet_name" {
  description = "Name of the subnet to host the SQL Server private networking resources"
  type        = string
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
