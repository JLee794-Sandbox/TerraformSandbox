#
# Required Parameters
# --------------------------------------------------
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Front Door service. Must be globally unique. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group in which the Front Door service should exist. Changing this forces a new resource to be created."
}


# -
# - FrontDoor WAF Parameters
# -
variable "front-door-waf-object" {
  description = "(Required) AFD Settings of the Azure Front Door to be created"
}

# -
# - FrontDoor Parameters
# -
variable "backend_pool" {
  type        = string
  description = "(Required) A backend_pool block as defined below."
}

variable "backend_pool_health_probe" {
  description = "(Required) A backend_pool_health_probe block as defined below."
  type = list(object({
    name = string
    enabled = bool // default: true
    path = string // default: "/"
    protocol = string // default: "Http"
    probe_method = string // default: "GET"
  }))
}

variable "backend_pool_load_balancing" {
  description = "(Required) A backend_pool_load_balancing block as defined below."
  type = object({
    name = string
    sample_size = number // default: 4
    successful_samples_required = number // default: 2
    additional_latency_milliseconds = number // default: 0
  })
}

variable "frontend_endpoint" {
  description = "(Required) A frontend_endpoint block as defined below."
  type = object({
    name = string
    host_name = string
    session_affinity_enabled = bool
    session_affinity_ttl_seconds = number
    web_application_firewall_policy_link_id = string
  })
}

variable "routing_rule" {
  description = "(Required) A routing_rule block as defined below."
  type = list(object({
    name = string
    frontend_endpoints = list(string)
    accepted_protocols = string // default: "Http"
    patterns_to_match = string // default: "/*"
    enabled = bool // default: true
    redirect_configuration = object({
      redirect_type = string // default: "Permanent"
      target_listener = string
      target_url = string
    })
    forwarding_configuration = object({
      backend_pool_name = string
      cache_enabled = bool // default: false
      cache_use_dynamic_compression = bool // default: false
      cache_query_parameter_strip_directive = string // default: "StripAll"
      cache_query_parameters = list(string) // Works only in combination with cache_query_parameter_strip_directive set to StripAllExcept or StripOnly
      cache_duration = string // Works only in combination with cache_enabled set to true
      custom_forwarding_path = string // Functionas a URL Rewrite, by default the URL path is preserved
      forwarding_protocol = string // default: "HttpsOnly"
    })
  }))
}

#
# Optional Parameters
# --------------------------------------------------
variable "load_balancer_enabled" {
  type        = bool
  description = "(Optional) Should the Front Door Load Balancer be Enabled? Defaults to true."
  default = true
}

variable "friendly_name" {
  type        = string
  description = "(Optional) Specifies a friendly name for the Front Door service. Changing this forces a new resource to be created."
  default = null
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

variable "tags" {
  type        = map(any)
  description = "(Optional) Map of key value pairs for the resource tagging. Default: none."
  default     = {}
}
