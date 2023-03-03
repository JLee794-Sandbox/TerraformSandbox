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

variable "backend_pools_send_receive_timeout_seconds" {
  type        = number
  description = "(Optional) Specifies the send and receive timeout on forwarding request to the backend. When the timeout is reached, the request fails and returns. Possible values are between 0 - 240. Defaults to 60."
  default     = 60
}

variable "enforce_backend_pools_certificate_name_check" {
  description = "(Optional) Enforce certificate name check on HTTPS requests to all backend pools, this setting will have no effect on HTTP requests. Permitted values are true or false."
  type        = bool
  default     = false
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

variable "global_settings" {

}
