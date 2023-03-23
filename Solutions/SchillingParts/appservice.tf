#
# Application resources
# - app service plan, app service, app service deployment, app service slot
# ------------------------------------------------------------
module "appservice_plan" {
  source = "../../Modules/webapps/asp"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  os_type             = "Linux"

  settings = {
    name = local.deploymentName
    # Reserved must be true for Linux, and false for Windows
    sku_name                 = var.appservice_plan_sku_name
    worker_count             = null
    per_site_scaling_enabled = false
    zone_balancing_enabled   = false
  }
  global_settings = local.global_settings

  tags = {
    "logStorageAccount" = module.storage_account.name
  }
  base_tags = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
}

module "app_insights" {
  source = "../../Modules/app_insights"

  name                = local.deploymentName
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  application_type  = "web"
  retention_in_days = var.application_log_retention_in_days
  global_settings   = local.global_settings
  tags = {
    "appServicePlanId" : module.appservice_plan.id
  }
  base_tags = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
}

module "linux_webapp" {
  source = "../../Modules/webapps/linux_appservice"

  name                      = local.deploymentName
  resource_group_name       = module.resource_group.name
  location                  = module.resource_group.location
  app_service_plan_id       = module.appservice_plan.id
  virtual_network_subnet_id = data.azurerm_subnet.serverfarm.id

  application_insight = module.app_insights
  settings = {
    source_control = {}

    # See _locals.appservice.tf for more details
    site_config = local.webapp_site_config
    backup      = local.webapp_backup
    logs        = local.webapp_logs
  }


  identity = {
    type = "SystemAssigned"
  }

  client_config = local.client_config

  storage_accounts = local.storage_accounts
  global_settings  = local.global_settings
  tags             = {}
  base_tags        = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
}


# [For DevOps CICD Agents]:
#   If running into Error: reading static website for AzureRM Storage Account | Context Deadline Exceeded
#   - This is caused by the Private Endpoint for the Storage Account
#   - Bug being tracked within:
#     - https://github.com/hashicorp/terraform-provider-azurerm/issues/13889
#     - https://github.com/hashicorp/terraform-provider-azurerm/issues/20257
#   - Workaround is to disable the Private Endpoint for the Storage Account (see private_dns.tf)
module "storage_account" {
  source = "../../Modules/storage_account"

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  client_config       = local.client_config

  resource_groups = {
    app = {
      location = module.resource_group.location
      name     = module.resource_group.name
    }
  }

  storage_account = {
    name                     = local.deploymentName
    allow_blob_public_access = true
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    containers = {
      logs = {
        "name" : "logs",
        "container_access_type" : "private"
      },
      backup = {
        "name" : "backup",
        "container_access_type" : "private"
      }
    }

    # Network rules breaks pipeline deployment until the self hosted agent is provisioned.
    network = {
      bypass = ["AzureServices", "Logging", "Metrics"]
      # ip_rules = [
      #   data.azurerm_subnet.devops.address_prefixes[0]
      # ]
      virtual_network_subnet_ids = [
        data.azurerm_subnet.devops.id,
        data.azurerm_subnet.data.id,
        data.azurerm_subnet.serverfarm.id
      ]
    }
    tags = merge(
      module.resource_group.tags,
      {
        "Utility" = "AppSvcLogging"
      }
    )
  }

  base_tags       = try(local.global_settings.inherit_tags, false) ? {} : local.base_tags
  global_settings = local.global_settings
}
