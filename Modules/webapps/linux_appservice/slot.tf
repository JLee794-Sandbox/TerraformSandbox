# Per options https://www.terraform.io/docs/providers/azurerm/r/app_service.html

resource "azurerm_linux_web_app_slot" "slots" {
  for_each = var.slots

  name            = each.value.name
  service_plan_id = var.app_service_plan_id
  app_service_id  = azurerm_linux_web_app.app_service.id
  tags            = local.tags

  client_affinity_enabled = lookup(var.settings, "client_affinity_enabled", null)
  enabled                 = lookup(var.settings, "enabled", null)
  https_only              = lookup(var.settings, "https_only", null)

  dynamic "identity" {
    for_each = try(var.identity, null) != null ? [1] : []

    content {
      type         = try(var.identity.type, null)
      identity_ids = lower(var.identity.type) == "userassigned" ? local.managed_identities : null
    }
  }

  key_vault_reference_identity_id = can(var.settings.key_vault_reference_identity.key) ? var.combined_objects.managed_identities[try(var.settings.identity.lz_key, var.client_config.landingzone_key)][var.settings.key_vault_reference_identity.key].id : try(var.settings.key_vault_reference_identity.id, null)

  dynamic "site_config" {
    for_each = lookup(var.settings, "site_config", {}) != {} ? [1] : []

    content {
      # numberOfWorkers           = lookup(each.value.site_config, "numberOfWorkers", 1)  # defined in ARM template below
      always_on                = lookup(var.settings.site_config, "always_on", false)
      app_command_line         = lookup(var.settings.site_config, "app_command_line", null)
      default_documents        = lookup(var.settings.site_config, "default_documents", null)
      ftps_state               = lookup(var.settings.site_config, "ftps_state", "FtpsOnly")
      health_check_path        = lookup(var.settings.site_config, "health_check_path", null)
      http2_enabled            = lookup(var.settings.site_config, "http2_enabled", false)
      load_balancing_mode      = lookup(var.settings.site_config, "load_balancing_mode", "LeastRequests")
      local_mysql_enabled      = lookup(var.settings.site_config, "local_mysql_enabled", null)
      managed_pipeline_mode    = lookup(var.settings.site_config, "managed_pipeline_mode", null)
      minimum_tls_version      = lookup(var.settings.site_config, "minimum_tls_version", "1.2")
      remote_debugging_enabled = lookup(var.settings.site_config, "remote_debugging_enabled", null)
      remote_debugging_version = lookup(var.settings.site_config, "remote_debugging_version", null)
      use_32_bit_worker        = lookup(var.settings.site_config, "use_32_bit_worker", false)
      websockets_enabled       = lookup(var.settings.site_config, "websockets_enabled", false)

      dynamic "application_stack" {
        for_each = lookup(var.settings.site_config, "application_stack", {}) != {} ? [1] : []

        content {
          docker_image        = lookup(var.settings.site_config.application_stack, "docker_image", null)
          docker_image_tag    = lookup(var.settings.site_config.application_stack, "docker_image_tag", null)
          dotnet_version      = lookup(var.settings.site_config.application_stack, "dotnet_version", null)
          go_version          = lookup(var.settings.site_config.application_stack, "go_version", null)
          java_server         = lookup(var.settings.site_config.application_stack, "java_server", null)
          java_server_version = lookup(var.settings.site_config.application_stack, "java_server_version", null)
          java_version        = lookup(var.settings.site_config.application_stack, "java_version", null)
          node_version        = lookup(var.settings.site_config.application_stack, "node_version", null)
          php_version         = lookup(var.settings.site_config.application_stack, "php_version", null)
          python_version      = lookup(var.settings.site_config.application_stack, "python_version", null)
          ruby_version        = lookup(var.settings.site_config.application_stack, "ruby_version", null)
        }
      }

      dynamic "cors" {
        for_each = lookup(var.settings.site_config, "cors", {}) != {} ? [1] : []

        content {
          allowed_origins     = lookup(var.settings.site_config.cors, "allowed_origins", null)
          support_credentials = lookup(var.settings.site_config.cors, "support_credentials", null)
        }
      }

      dynamic "ip_restriction" {
        for_each = try(var.settings.site_config.ip_restriction, {})

        content {
          ip_address                = lookup(ip_restriction.value, "ip_address", null)
          service_tag               = lookup(ip_restriction.value, "service_tag", null)
          virtual_network_subnet_id = can(ip_restriction.value.virtual_network_subnet_id) || can(ip_restriction.value.virtual_network_subnet.id) || can(ip_restriction.value.virtual_network_subnet.subnet_key) == false ? try(ip_restriction.value.virtual_network_subnet_id, ip_restriction.value.virtual_network_subnet.id, null) : var.combined_objects.networking[try(ip_restriction.value.virtual_network_subnet.lz_key, var.client_config.landingzone_key)][ip_restriction.value.virtual_network_subnet.vnet_key].subnets[ip_restriction.value.virtual_network_subnet.subnet_key].id
          name                      = lookup(ip_restriction.value, "name", null)
          priority                  = lookup(ip_restriction.value, "priority", null)
          action                    = lookup(ip_restriction.value, "action", null)
          dynamic "headers" {
            for_each = try(ip_restriction.headers, {})

            content {
              x_azure_fdid      = lookup(headers.value, "x_azure_fdid", null)
              x_fd_health_probe = lookup(headers.value, "x_fd_health_probe", null)
              x_forwarded_for   = lookup(headers.value, "x_forwarded_for", null)
              x_forwarded_host  = lookup(headers.value, "x_forwarded_host", null)
            }
          }
        }
      }
    }
  }

  app_settings = local.app_settings

  dynamic "connection_string" {
    for_each = var.connection_strings

    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  dynamic "auth_settings" {
    for_each = lookup(var.settings, "auth_settings", {}) != {} ? [1] : []

    content {
      enabled                        = lookup(var.settings.auth_settings, "enabled", false)
      additional_login_parameters    = lookup(var.settings.auth_settings, "additional_login_parameters", null)
      allowed_external_redirect_urls = lookup(var.settings.auth_settings, "allowed_external_redirect_urls", null)
      default_provider               = lookup(var.settings.auth_settings, "default_provider", null)
      issuer                         = lookup(var.settings.auth_settings, "issuer", null)
      runtime_version                = lookup(var.settings.auth_settings, "runtime_version", null)
      token_refresh_extension_hours  = lookup(var.settings.auth_settings, "token_refresh_extension_hours", null)
      token_store_enabled            = lookup(var.settings.auth_settings, "token_store_enabled", null)
      unauthenticated_client_action  = lookup(var.settings.auth_settings, "unauthenticated_client_action", null)

      dynamic "active_directory" {
        for_each = lookup(var.settings.auth_settings, "active_directory", {}) != {} ? [1] : []

        content {
          client_id         = var.settings.auth_settings.active_directory.client_id
          client_secret     = lookup(var.settings.auth_settings.active_directory, "client_secret", null)
          allowed_audiences = lookup(var.settings.auth_settings.active_directory, "allowed_audiences", null)
        }
      }

      dynamic "facebook" {
        for_each = lookup(var.settings.auth_settings, "facebook", {}) != {} ? [1] : []

        content {
          app_id       = var.settings.auth_settings.facebook.app_id
          app_secret   = var.settings.auth_settings.facebook.app_secret
          oauth_scopes = lookup(var.settings.auth_settings.facebook, "oauth_scopes", null)
        }
      }

      dynamic "google" {
        for_each = lookup(var.settings.auth_settings, "google", {}) != {} ? [1] : []

        content {
          client_id     = var.settings.auth_settings.google.client_id
          client_secret = var.settings.auth_settings.google.client_secret
          oauth_scopes  = lookup(var.settings.auth_settings.google, "oauth_scopes", null)
        }
      }

      dynamic "microsoft" {
        for_each = lookup(var.settings.auth_settings, "microsoft", {}) != {} ? [1] : []

        content {
          client_id     = var.settings.auth_settings.microsoft.client_id
          client_secret = var.settings.auth_settings.microsoft.client_secret
          oauth_scopes  = lookup(var.settings.auth_settings.microsoft, "oauth_scopes", null)
        }
      }

      dynamic "twitter" {
        for_each = lookup(var.settings.auth_settings, "twitter", {}) != {} ? [1] : []

        content {
          consumer_key    = var.settings.auth_settings.twitter.consumer_key
          consumer_secret = var.settings.auth_settings.twitter.consumer_secret
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"]
    ]
  }
}
