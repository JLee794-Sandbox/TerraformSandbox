#
# Shared Variables
# -----------------
location = "eastus2"

#
# Network Variables
# -----------------
network_rg_name = "SP-PoC-Network"

# Virtual Network
virtual_networks = {
  virtualnetwork1 = {
    name                 = "sppoc-appvnet"
    address_space        = ["10.0.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  },
  virtualnetwork2 = {
    name                 = "sppoc-gatewayvnet"
    address_space        = ["172.16.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  }
}
# VNet Peering
vnet_peering = {
  GatewayToApp = {
    destination_vnet_name        = "sppoc-appvnet"
    destination_vnet_rg          = "SP-PoC-Network"
    vnet_key                     = "virtualnetwork2"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}

# Subnet
subnets = {
  subnet1 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #sppocvnetfirst
    name              = "loadbalancer"
    address_prefixes  = ["10.0.1.0/24"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.AzureCosmosDB"]
    pe_enable         = false
    delegation        = []
  },
  subnet2 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #sppocvnetfirst
    name              = "proxy"
    address_prefixes  = ["10.0.2.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet3 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #sppocvnetfirst
    name              = "application"
    address_prefixes  = ["10.0.3.0/24"]
    pe_enable         = false
    service_endpoints = ["Microsoft.Sql", "Microsoft.AzureCosmosDB"]
    delegation        = []
  },
  subnet4 = {
    vnet_key          = "virtualnetwork2"
    vnet_name         = null #sppocvnetsecond
    name              = "frontdoor"
    address_prefixes  = ["172.16.0.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  }
}

# Network Security Groups
network_security_groups = {
  nsg1 = {
    name                      = "nsg1"
    tags                      = { log_workspace = "sandbox-law" }
    subnet_name               = "loadbalancer"
    vnet_name                 = null
    networking_resource_group = null
    security_rules = [
      {
        name                                         = "nsg"
        description                                  = "NSG"
        priority                                     = 101
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "*"
        source_address_prefixes                      = null
        destination_address_prefix                   = "*"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null # ["asg-src"]
        destination_application_security_group_names = null # ["asg-dest"]
      }
    ]
  }
}

#
# App Variables
# -----------------
app_rg_name = "SP-PoC-App"

# Storage Account
storage_account_name = "sppocstorage321"
account_tier         = "Standard"
containers = [
  {
    "name" : "container1",
    "access_type" : "private"
  },
  {
    "name" : "container2",
    "access_type" : "private"
  }
]
soft_delete_retention = 0

# Key Vault
key_vault_name = "sppockeyvault"
sku_name       = "standard"

#
# Front Door
# -----------------
resource_group_name = "validation-rg"
front-door-waf-object = {
  waf1 = {
    name         = "exampleFrontendEndpoint1"
    enabled      = true
    mode         = "Prevention"
    redirect_url = "https://www.bing.com"
    custom_rule = {
      cr1 = {
        name     = "Rule1"
        action   = "Block"
        enabled  = true
        priority = 1
        type     = "MatchRule"
        match_condition = {
          match_variable     = "RequestHeader"
          match_values       = ["windows"]
          operator           = "Contains"
          selector           = "UserAgent"
          negation_condition = false
          transforms         = ["Lowercase", "Trim"]
        }
        rate_limit_duration_in_minutes = 1
        rate_limit_threshold           = 10

      }
    }
    custom_block_response_status_code = 403
    custom_block_response_body        = "<html><body>You are blocked</body></html>"

    managed_rule = {
      mr1 = {
        type    = "DefaultRuleSet"
        version = "1.0"
        exclusion = {
          ex1 = {
            match_variable = "QueryStringArgNames"
            operator       = "Equals"
            selector       = "not_suspicious"
          }
        }
        override = {
          or1 = {
            rule_group_name = "PHP"
            exclusion = {
              ex1 = {
                match_variable = "QueryStringArgNames"
                operator       = "Equals"
                selector       = "not_suspicious"
              }
            }
            rule = {
              r1 = {
                rule_id = "933100"
                action  = "Block"
                enabled = false
                exclusion = {
                  ex1 = {
                    match_variable = "QueryStringArgNames"
                    operator       = "Equals"
                    selector       = "not_suspicious"
                  }
                }
              }
            }
          }
        }
      }
    }
    tags = ""
  }
}

front-door-object = {
  name          = "exampleFrontendEndpoint1"
  friendly_name = "CAF Test for Azure Front Door"
  load_balancer_enabled  = true

  frontend_endpoint = {
      session_affinity_enabled          = false 
      session_affinity_ttl_seconds      = 0     
      azurerm_frontdoor_custom_https_configuration  = false
      web_application_firewall_policy_link_id = "exampleFrontendEndpoint1" //"testwafpolicy"  
  }
  routing_rule = {
    rr1 = {
      name               = "exampleRoutingRule1"
      frontend_endpoints = ["exampleFrontendEndpoint1"]
      accepted_protocols = ["Http", "Https"] 
      patterns_to_match  = ["/*"]           
      enabled            = true              
      configuration      = "Forwarding"        
      forwarding_configuration = {
        backend_pool_name                     = "exampleBackendBing1"
        cache_enabled                         = false       
        cache_use_dynamic_compression         = false       
        cache_query_parameter_strip_directive = "StripAll" 
        custom_forwarding_path                = ""
        forwarding_protocol                   = "MatchRequest"   
      }
      redirect_configuration = {
        custom_host         = ""             
        redirect_protocol   = "MatchRequest"   
        redirect_type       = "Found"        
        custom_fragment     = ""
        custom_path         = ""
        custom_query_string = ""
      }
    } 
  }

  backend_pool_load_balancing = {
    lb1 = {
      name                            = "exampleLoadBalancingSettings1"
      sample_size                     = 4
      successful_samples_required     = 2
      additional_latency_milliseconds = 0 
    }                                     
  }

  backend_pool_health_probe = {
    hp1 = {
      name                = "exampleHealthProbeSetting1"
      path                = "/"
      protocol            = "Http"
      interval_in_seconds = 120    
    }                             
  }

  backend_pool = {
    bp1 = {
      name = "exampleBackendBing1"
      backend = {
        be1 = {
          enabled     = true
          address     = "www.bing.com"
          host_header = "www.bing.com"
          http_port   = 80
          https_port  = 443
          priority    = 1  
          weight      = 50
        },
        be2 = {
          enabled     = true
          address     = "www.bing.co.uk"
          host_header = "www.bing.co.uk"
          http_port   = 80
          https_port  = 443
          priority    = 1 
          weight      = 50
        }
      }
      load_balancing_name = "exampleLoadBalancingSettings1"
      health_probe_name   = "exampleHealthProbeSetting1"
    } 
  }
}