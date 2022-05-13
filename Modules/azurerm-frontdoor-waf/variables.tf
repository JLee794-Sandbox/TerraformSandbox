#
# Required Parameters
# --------------------------------------------------
variable "name" {
  type        = string
  description = "(Required) Specifies the name of FrontDoor and associated resources."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group in which the Front Door service should exist. Changing this forces a new resource to be created."
}

variable "backend_host_header" {
  type        = string
  description = "(Required) The value to use as the host header sent to the backend."
}

variable "backend_address" {
  type        = string
  description = "(Required) Location of the backend (IP address or FQDN)"
}

variable "backend_http_port" {
  type        = number
  description = "(Optional) The HTTP TCP port number. Possible values are between 1 - 65535."
  default     = 80
}

variable "backend_https_port" {
  type        = number
  description = "(Optional) The HTTPS TCP port number. Possible values are between 1 - 65535."
  default     = 443
}

variable "custom_https_configuration" {
  type = object({
    certificate_source      = string
    certificate_secret_name = string
    certificate_vault_id    = string
  })
  description = "(Optional) Custom HTTPS configuration."
  default     = null

}

variable "tags" {
  type        = map(any)
  description = "(Optional) Map of key value pairs for the resource tagging. Default: none."
  default     = {}
}
