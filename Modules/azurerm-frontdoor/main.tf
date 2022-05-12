// TODO: Break up WAF and FrontDoor
// TODO: Simplify variables once desired state is defined

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

#
# Create FrontDoor
#   Scope of the requirement
#   - Single frontdoor for small-medium size application (1-to-1)
#   - Public facing application that only accepts https connections
#   - WAF policies are still TBD
# ------------------------------------------------------------
resource "azurerm_frontdoor" "this" {
  name                = var.frontdoor_name
  resource_group_name = data.azurerm_resource_group.this.name

  routing_rule {
    name               = "${var.frontdoor_name}-rr"
    accepted_protocols = ["Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["${var.frontdoor_name}-fe-ep"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "${var.frontdoor_name}-be-pool"
    }
  }

  backend_pool_load_balancing {
    name = "${var.frontdoor_name}-be-lb"
  }

  backend_pool_health_probe {
    name = "${var.frontdoor_name}-be-hp"
  }

  backend_pool {
    name = "${var.frontdoor_name}-be-pool"
    backend {
      host_header = var.backend_host_header
      address     = var.backend_address
      http_port   = var.backend_http_port
      https_port  = var.backend_https_port
    }

    load_balancing_name = "${var.frontdoor_name}-be-lb"
    health_probe_name   = "${var.frontdoor_name}-be-hp"
  }

  frontend_endpoint {
    name      = "${var.frontdoor_name}-fe-ep"
    host_name = "${var.frontdoor_name}.azurefd.net"
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

  frontend_endpoint_id              = azurerm_frontdoor.this.frontend_endpoints["${var.frontdoor_name}-fe-ep"]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = var.custom_https_configuration.certificate_source
    azure_key_vault_certificate_secret_name = var.custom_https_configuration.certificate_secret_name
    azure_key_vault_certificate_vault_id    = var.custom_https_configuration.certificate_vault_id
  }
}
