// TODO: Break up WAF and FrontDoor
// TODO: Simplify variables once desired state is defined

#
# Create FrontDoor
#   Scope of the requirement
#   - Single frontdoor for small-medium size application (1-to-1)
#   - Public facing application that only accepts https connections
#   - WAF policies are still TBD
# ------------------------------------------------------------
resource "azurerm_frontdoor" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name

  routing_rule {
    name               = "${var.name}-rr"
    accepted_protocols = ["Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["${var.name}-fe-ep"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "${var.name}-be-pool"
    }
  }

  backend_pool_load_balancing {
    name = "${var.name}-be-lb"
  }

  backend_pool_health_probe {
    name = "${var.name}-be-hp"
  }

  backend_pool {
    name = "${var.name}-be-pool"
    backend {
      host_header = var.backend_host_header
      address     = var.backend_address
      http_port   = var.backend_http_port
      https_port  = var.backend_https_port
    }

    load_balancing_name = "${var.name}-be-lb"
    health_probe_name   = "${var.name}-be-hp"
  }

  frontend_endpoint {
    name      = "${var.name}-fe-ep"
    host_name = "${var.name}.azurefd.net"
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

  frontend_endpoint_id              = azurerm_frontdoor.this.frontend_endpoints["${var.name}-fe-ep"]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = var.custom_https_configuration.certificate_source
    azure_key_vault_certificate_secret_name = var.custom_https_configuration.certificate_secret_name
    azure_key_vault_certificate_vault_id    = var.custom_https_configuration.certificate_vault_id
  }
}
