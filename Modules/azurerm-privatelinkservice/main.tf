# data "azurerm_resource_group" "this" {
#   count = local.resourcegroup_state_exists == false ? 1 : 0
#   name  = var.resource_group_name
# }

# data "azurerm_subnet" "this" {
#   for_each             = local.networking_state_exists == false ? var.private_link_services : {}
#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.vnet_name
#   resource_group_name  = each.value.networking_resource_group != null ? each.value.networking_resource_group : (local.resourcegroup_state_exists == true ? var.resource_group_name : data.azurerm_resource_group.this.0.name)

# }

# data "azurerm_lb" "this" {
#   for_each            = local.loadbalancer_state_exists == false ? var.private_link_services : {}
#   name                = each.value.loadbalancer_name
#   resource_group_name = local.resourcegroup_state_exists == true ? var.resource_group_name : data.azurerm_resource_group.this.0.name
# }

data "azurerm_client_config" "current" {}

locals {
  auto_approval_subscription_ids = concat([data.azurerm_client_config.current.subscription_id], var.auto_approval_subscription_ids)
  visibility_subscription_ids    = concat([data.azurerm_client_config.current.subscription_id], var.visibility_subscription_ids)

  # tags                       = merge(var.pls_additional_tags, (local.resourcegroup_state_exists == true ? lookup(data.terraform_remote_state.resourcegroup.outputs.resource_group_tags_map, var.resource_group_name) : data.azurerm_resource_group.this.0.tags))
  # resourcegroup_state_exists = length(values(data.terraform_remote_state.resourcegroup.outputs)) == 0 ? false : true
  # networking_state_exists    = length(values(data.terraform_remote_state.networking.outputs)) == 0 ? false : true
  # loadbalancer_state_exists  = length(values(data.terraform_remote_state.loadbalancer.outputs)) == 0 ? false : true

  # frontend_ip_configurations = flatten([
  #   for lb in data.azurerm_lb.this : [
  #     for config in lb.frontend_ip_configuration : {
  #       name = config.name
  #       id   = config.id
  #     }
  #   ]
  # ])
  # frontend_ip_configurations_map = {
  #   for config in local.frontend_ip_configurations : config.name => config.id
  # }
}

# -
# - Private Link Service
# -
resource "azurerm_private_link_service" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  auto_approval_subscription_ids              = local.auto_approval_subscription_ids
  visibility_subscription_ids                 = local.visibility_subscription_ids
  load_balancer_frontend_ip_configuration_ids = var.load_balancer_frontend_ip_configuration_ids

  dynamic "nat_ip_configuration" {
    for_each = var.nat_ip_configurations
    content {
      name      = nat_ip_configuration.key
      primary   = nat_ip_configuration.value.primary
      subnet_id = nat_ip_configuration.value.subnet_id

      private_ip_address         = lookup(nat_ip_configuration.value, "private_ip_address", null)
      private_ip_address_version = coalesce(lookup(nat_ip_configuration.value, "private_ip_address_version"), "IPv4")
    }
  }

  tags = var.tags
}
