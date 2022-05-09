// TODO: Break up WAF and FrontDoor
// TODO: Simplify variables once desired state is defined

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

#
# Define Locals to help with complex object mapping
# ------------------------------------------------------------
locals {
  waf-map = {
    for waf in azurerm_frontdoor_firewall_policy.this:
      waf.name => waf.id
  }
}

#
# Create FrontDoor WAF policies
# ------------------------------------------------------------
resource "azurerm_frontdoor_firewall_policy" "this" {
  for_each                          = var.front-door-waf-object
  name                              = each.value.name
  resource_group_name               = data.azurerm_resource_group.this.name
  tags                              = var.tags
  enabled                           = each.value.enabled
  mode                              = each.value.mode
  redirect_url                      = each.value.redirect_url
  custom_block_response_status_code = each.value.custom_block_response_status_code
  custom_block_response_body        = fileexists(each.value.custom_block_response_body) ? base64encode(file(each.value.custom_block_response_body)) : base64encode(each.value.custom_block_response_body)         # Accepts a file path or content  

  dynamic "custom_rule" {
    for_each = each.value.custom_rule
    content {
      name     = custom_rule.value.name
      action   = custom_rule.value.action
      enabled  = custom_rule.value.enabled
      priority = custom_rule.value.priority
      type     = custom_rule.value.type
      dynamic "match_condition" {
        for_each = [custom_rule.value.match_condition]
        content {
          match_variable     = match_condition.value.match_variable
          match_values       = match_condition.value.match_values
          operator           = match_condition.value.operator
          selector           = match_condition.value.selector
          negation_condition = match_condition.value.negation_condition
          transforms         = match_condition.value.transforms
        }
      }
      rate_limit_duration_in_minutes = custom_rule.value.rate_limit_duration_in_minutes
      rate_limit_threshold           = custom_rule.value.rate_limit_threshold
    }
  }

  dynamic "managed_rule" {
    for_each = each.value.managed_rule
    content {
      type    = managed_rule.value.type
      version = managed_rule.value.version


      dynamic "exclusion" {
        for_each = managed_rule.value.exclusion
        content {
          match_variable = exclusion.value.match_variable
          operator       = exclusion.value.operator
          selector       = exclusion.value.selector
        }
      }
      dynamic "override" {
        for_each = managed_rule.value.override
        content {
          rule_group_name = override.value.rule_group_name

          dynamic "exclusion" {
            for_each = override.value.exclusion
            content {
              match_variable = exclusion.value.match_variable
              operator       = exclusion.value.operator
              selector       = exclusion.value.selector
            }
          }

          dynamic "rule" {
            for_each = override.value.rule
            content {
              rule_id = rule.value.rule_id
              action  = rule.value.action
              enabled = rule.value.enabled

              dynamic "exclusion" {
                for_each = rule.value.exclusion
                content {
                  match_variable = exclusion.value.match_variable
                  operator       = exclusion.value.operator
                  selector       = exclusion.value.selector
                }
              }
            }
          }
        }
      }
    }
  }
}

#
# Create FrontDoor
# ------------------------------------------------------------
resource "azurerm_frontdoor" "this" {
  depends_on                                   = [azurerm_frontdoor_firewall_policy.this]
  name                                         = var.front-door-object.name
  friendly_name                                = var.front-door-object.friendly_name
  resource_group_name                          = data.azurerm_resource_group.this.name
  load_balancer_enabled                        = var.front-door-object.load_balancer_enabled
  tags                                         = var.tags

  # !!! NOTE !!!
  # frontend_endpoint hostname and name MUST MATCH the name of the frontdoor
  frontend_endpoint {
      name = var.front-door-object.name
      host_name                         = "${var.front-door-object.name}.azurefd.net"
      session_affinity_enabled          = var.front-door-object.frontend_endpoint.session_affinity_enabled
      session_affinity_ttl_seconds      = var.front-door-object.frontend_endpoint.session_affinity_ttl_seconds
      web_application_firewall_policy_link_id =  var.front-door-object.frontend_endpoint.web_application_firewall_policy_link_id != "" ? local.waf-map[ var.front-door-object.frontend_endpoint.web_application_firewall_policy_link_id] : ""
  }

  dynamic "routing_rule" {
    for_each = var.front-door-object.routing_rule
    content {
      name               = routing_rule.value.name
      accepted_protocols = routing_rule.value.accepted_protocols
      patterns_to_match  = routing_rule.value.patterns_to_match
      frontend_endpoints = routing_rule.value.frontend_endpoints

      dynamic "forwarding_configuration" {
        for_each = routing_rule.value.configuration == "Forwarding" ? [routing_rule.value.forwarding_configuration] : []
        content {
          backend_pool_name                     = routing_rule.value.forwarding_configuration.backend_pool_name
          cache_enabled                         = routing_rule.value.forwarding_configuration.cache_enabled                           
          cache_use_dynamic_compression         = routing_rule.value.forwarding_configuration.cache_use_dynamic_compression #default: false
          cache_query_parameter_strip_directive = routing_rule.value.forwarding_configuration.cache_query_parameter_strip_directive
          custom_forwarding_path                = routing_rule.value.forwarding_configuration.custom_forwarding_path
          forwarding_protocol                   = routing_rule.value.forwarding_configuration.forwarding_protocol
        }
      }
      dynamic "redirect_configuration" {
        for_each = routing_rule.value.configuration == "Redirecting" ? [routing_rule.value.redirect_configuration] : []
        content {
          custom_host         = routing_rule.value.redirect_configuration.custom_host
          redirect_protocol   = routing_rule.value.redirect_configuration.redirect_protocol
          redirect_type       = routing_rule.value.redirect_configuration.redirect_type
          custom_fragment     = routing_rule.value.redirect_configuration.custom_fragment
          custom_path         = routing_rule.value.redirect_configuration.custom_path
          custom_query_string = routing_rule.value.redirect_configuration.custom_query_string
        }
      }
    }
  }

  dynamic "backend_pool_load_balancing" {
    for_each = var.front-door-object.backend_pool_load_balancing
    content {
      name                            = backend_pool_load_balancing.value.name
      sample_size                     = backend_pool_load_balancing.value.sample_size
      successful_samples_required     = backend_pool_load_balancing.value.successful_samples_required
      additional_latency_milliseconds = backend_pool_load_balancing.value.additional_latency_milliseconds
    }
  }

  dynamic "backend_pool_health_probe" {
    for_each = var.front-door-object.backend_pool_health_probe
    content {
      name                = backend_pool_health_probe.value.name
      path                = backend_pool_health_probe.value.path
      protocol            = backend_pool_health_probe.value.protocol
      interval_in_seconds = backend_pool_health_probe.value.interval_in_seconds
    }
  }

  dynamic "backend_pool" {
    for_each = var.front-door-object.backend_pool
    content {
      name                = backend_pool.value.name
      load_balancing_name = backend_pool.value.load_balancing_name
      health_probe_name   = backend_pool.value.health_probe_name

      dynamic "backend" {
        for_each = backend_pool.value.backend
        content {
          enabled     = backend.value.enabled
          address     = backend.value.address
          host_header = backend.value.host_header
          http_port   = backend.value.http_port
          https_port  = backend.value.https_port
          priority    = backend.value.priority
          weight      = backend.value.weight
        }
      }
    }
  }
}

// resource "azurerm_frontdoor_custom_https_configuration" "example_custom_https_0" {
//   frontend_endpoint_id              = azurerm_frontdoor.example.frontend_endpoints["exampleFrontendEndpoint1"]
//   custom_https_provisioning_enabled = false
// }

// resource "azurerm_frontdoor_custom_https_configuration" "example_custom_https_1" {
//   frontend_endpoint_id              = azurerm_frontdoor.example.frontend_endpoints["exampleFrontendEndpoint2"]
//   custom_https_provisioning_enabled = true

//   custom_https_configuration {
//     certificate_source                      = "AzureKeyVault"
//     azure_key_vault_certificate_secret_name = "examplefd1"
//     azure_key_vault_certificate_vault_id    = data.azurerm_key_vault.vault.id
//   }
// }