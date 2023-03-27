// TODO: Break up WAF and FrontDoor
// TODO: Simplify variables once desired state is defined

#
# Create FrontDoor
#   Scope of the requirement
#   - Single frontdoor for small-medium size application (1-to-1)
#   - Public facing application that only accepts https connections
#   - WAF policies are still TBD
# ------------------------------------------------------------
resource "azurecaf_name" "afd" {
  name          = var.name
  resource_type = "azurerm_frontdoor"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

locals {
  backend_pool_name      = "${var.name}-be-pool"
  frontend_endpoint_name = "${var.name}-fe"
}

# TODO: Further parameterize frontdoor config blocks
resource "azurerm_cdn_frontdoor_profile" "this" {
  name                = azurecaf_name.afd.result
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "this" {
  name                     = "${var.name}-afd-originGroup"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
}

resource "azurerm_cdn_frontdoor_origin" "this" {
  name                          = "${var.name}-origin"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
  enabled                       = true

  certificate_name_check_enabled = false

  host_name          = var.host_name
  http_port          = 80
  https_port         = 443
  origin_host_header = "www.${var.host_domain_name}.com"
  priority           = 1
  weight             = 1
}

resource "azurerm_frontdoor_endpoint" "this" {
  name                     = "${var.name}-endpoint"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
}

resource "azurerm_cdn_frontdoor_custom_domain" "this" {
  name                     = "${var.name}-${var.host_domain_name}-custom-domain"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
  dns_zone_id              = var.dns_zone.id
  host_name                = var.host_domain_name

  tls {
    minimum_tls_version     = "TLS12"
    certificate_type        = var.certificate_type
    cdn_frontdoor_secret_id = var.cdn_frontdoor_secret_id
  }
}

resource "azurerm_cdn_frontdoor_route" "this" {
  # TODO: Add support for multiple routes
  name                          = "${var.name}-route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.this.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.this.id]
  cdn_frontdoor_rule_set_ids    = [azurerm_cdn_frontdoor_rule_set.this.id]
  enabled                       = true

  forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  patterns_to_match      = ["/*"]
  supported_protocols    = ["Https"]

  cdn_frontdoor_custom_domain_ids = [azurerm_cdn_frontdoor_custom_domain.this.id]
  link_to_default_domain          = false

  cache {
    query_string_caching_behavior = "IgnoreSpecifiedQueryStrings"
    query_strings                 = ["account", "settings"]
    compression_enabled           = true
    content_types_to_compress     = ["text/html", "text/javascript", "text/xml"]
  }
}


resource "azurerm_cdn_frontdoor_custom_domain_association" "contoso" {
  cdn_frontdoor_custom_domain_id = azurerm_cdn_frontdoor_custom_domain.this.id
  cdn_frontdoor_route_ids        = [azurerm_cdn_frontdoor_route.this.id]
}


resource "azurerm_cdn_frontdoor_rule_set" "this" {
  name                     = "thisruleset"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
}

resource "azurerm_cdn_frontdoor_rule" "this" {
  depends_on = [azurerm_cdn_frontdoor_origin_group.this, azurerm_cdn_frontdoor_origin.this]

  name                      = "${var.host_domain_name}-rule"
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.this.id
  order                     = 1
  behavior_on_match         = "Continue"

  actions {
    route_configuration_override_action {
      cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
      forwarding_protocol           = "HttpsOnly"
      query_string_caching_behavior = "IncludeSpecifiedQueryStrings"
      query_string_parameters       = ["foo", "clientIp={client_ip}"]
      compression_enabled           = true
      cache_behavior                = "OverrideIfOriginMissing"
      cache_duration                = "365.23:59:59"
    }

    url_redirect_action {
      redirect_type        = "PermanentRedirect"
      redirect_protocol    = "MatchRequest"
      query_string         = "clientIp={client_ip}"
      destination_path     = "/thisredirection"
      destination_hostname = "contoso.com"
      destination_fragment = "UrlRedirect"
    }
  }

  conditions {
    host_name_condition {
      operator         = "Equal"
      negate_condition = false
      match_values     = ["www.contoso.com", "images.contoso.com", "video.contoso.com"]
      transforms       = ["Lowercase", "Trim"]
    }

    is_device_condition {
      operator         = "Equal"
      negate_condition = false
      match_values     = ["Mobile"]
    }

    post_args_condition {
      post_args_name = "customerName"
      operator       = "BeginsWith"
      match_values   = ["J", "K"]
      transforms     = ["Uppercase"]
    }

    request_method_condition {
      operator         = "Equal"
      negate_condition = false
      match_values     = ["DELETE"]
    }

    url_filename_condition {
      operator         = "Equal"
      negate_condition = false
      match_values     = ["media.mp4"]
      transforms       = ["Lowercase", "RemoveNulls", "Trim"]
    }
  }
}

# resource "azurerm_frontdoor" "this" {
#   name                = azurecaf_name.afd.result
#   resource_group_name = var.resource_group_name

#   routing_rule {
#     name               = "${var.name}-rr"
#     accepted_protocols = ["Https"]
#     patterns_to_match  = ["/*"]
#     frontend_endpoints = [local.frontend_endpoint_name]
#     forwarding_configuration {
#       forwarding_protocol = "MatchRequest"
#       backend_pool_name   = local.backend_pool_name
#     }
#   }

#   backend_pool_load_balancing {
#     name = "${var.name}-be-lb"
#   }

#   backend_pool_health_probe {
#     name = "${var.name}-be-hp"
#   }

#   backend_pool {
#     name = local.backend_pool_name
#     backend {
#       host_header = var.backend_host_header
#       address     = var.backend_address
#       http_port   = var.backend_http_port
#       https_port  = var.backend_https_port
#     }

#     load_balancing_name = "${var.name}-be-lb"
#     health_probe_name   = "${var.name}-be-hp"
#   }

#   // Note: backend_pool_settings applies to ALL backend pools
#   backend_pool_settings {
#     backend_pools_send_receive_timeout_seconds   = var.backend_pools_send_receive_timeout_seconds
#     enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check
#   }

#   frontend_endpoint {
#     name      = local.frontend_endpoint_name
#     host_name = "${azurecaf_name.afd.result}.azurefd.net"
#   }

#   tags = var.tags

#   lifecycle {
#     ignore_changes = [
#       tags
#     ]
#   }
# }
