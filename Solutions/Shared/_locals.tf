locals {
  ###############################
  # Global settings to set your naming convention config for each module
  ###############################
  global_settings = {
    inherit_tags   = true
    default_region = "region1"
    regions = {
      region1 = var.location
    }
    prefixes      = var.prefixes
    random_length = null
    passthrough   = false
    use_slug      = false
    environment   = var.environment_code
  }

  ###############################
  # Base tags to set at the resource group level for inheritance of child resources
  ###############################
  base_tags = merge(
    var.tags,
    {
      "DeploymentTemplate" = "ShillingParts"
      "Environment"        = local.environment_mapping[var.environment_code]
      "Owner"              = var.owner
      "Application"        = var.application_name
    }
  )

  ###############################
  # Resource naming formatting for the module per customer requirement
  ###############################
  short_location_names = {
    "eastus"         = "eus"
    "westus"         = "wus"
    "eastus2"        = "eus2"
    "southcentralus" = "scus"
  }

  deploymentName = lower("${var.country_code}${var.environment_code}${local.short_location_names[var.location]}-${var.application_name}")

  environment_mapping = {
    "02" = "nonprod"
    "03" = "backup"
    "04" = "prod"
  }

  ###############################
  # Client config to allow for dynamic client config to be passed in to caf modules
  ###############################
  client_config = var.client_config == {} ? {
    client_id               = data.azurerm_client_config.current.client_id
    landingzone_key         = "local"
    logged_aad_app_objectId = data.azurerm_client_config.current.object_id
    logged_user_objectId    = data.azurerm_client_config.current.object_id
    object_id               = data.azurerm_client_config.current.object_id
    subscription_id         = data.azurerm_client_config.current.subscription_id
    tenant_id               = data.azurerm_client_config.current.tenant_id
  } : map(var.client_config)

  azuaread_group_id = var.azuread_group_id == null ? data.azuread_group.admins[0].id : var.azuread_group_id
}
