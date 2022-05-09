resource_group_name = "validation-rg"

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