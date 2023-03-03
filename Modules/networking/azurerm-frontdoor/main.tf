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
resource "azurerm_frontdoor" "this" {
  name                = azurecaf_name.afd.result
  resource_group_name = var.resource_group_name

  routing_rule {
    name               = "${var.name}-rr"
    accepted_protocols = ["Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = [local.frontend_endpoint_name]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = local.backend_pool_name
    }
  }

  backend_pool_load_balancing {
    name = "${var.name}-be-lb"
  }

  backend_pool_health_probe {
    name = "${var.name}-be-hp"
  }

  backend_pool {
    name = local.backend_pool_name
    backend {
      host_header = var.backend_host_header
      address     = var.backend_address
      http_port   = var.backend_http_port
      https_port  = var.backend_https_port
    }

    load_balancing_name = "${var.name}-be-lb"
    health_probe_name   = "${var.name}-be-hp"
  }

  // Note: backend_pool_settings applies to ALL backend pools
  backend_pool_settings {
    backend_pools_send_receive_timeout_seconds   = var.backend_pools_send_receive_timeout_seconds
    enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check
  }

  frontend_endpoint {
    name      = local.frontend_endpoint_name
    host_name = "${azurecaf_name.afd.result}.azurefd.net"
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_frontdoor_custom_https_configuration" "this" {
  count = var.custom_https_configuration == null ? 0 : 1

  frontend_endpoint_id              = azurerm_frontdoor.this.frontend_endpoints[local.frontend_endpoint_name]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = var.custom_https_configuration.certificate_source
    azure_key_vault_certificate_secret_name = var.custom_https_configuration.certificate_secret_name
    azure_key_vault_certificate_vault_id    = var.custom_https_configuration.certificate_vault_id
  }
}
