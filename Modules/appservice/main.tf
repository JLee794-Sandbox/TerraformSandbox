# -
# - Get existing resource values
# - 
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_subnet" "ase" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = data.azurerm_resource_group.this.name
}

# -
# - Create ASE
# - 
resource "azurerm_app_service_environment_v3" "this" {
  name                         = "az-ase-${var.name}"
  resource_group_name          = data.azurerm_resource_group.this.name
  subnet_id                    = data.azurerm_subnet.ase.id
  internal_load_balancing_mode = var.internal_load_balancing_mode
  zone_redundant               = var.zone_redundant

  tags = var.tags
}

# -
# - Create ASP
# - 
resource "azurerm_service_plan" "this" {
  name                       = "az-asp-${var.name}"
  location                   = data.azurerm_resource_group.this.location
  resource_group_name        = data.azurerm_resource_group.this.name
  app_service_environment_id = azurerm_app_service_environment_v3.this.id

  os_type = var.os_type
  sku_name = var.sku_name
  worker_count = var.worker_count
  zone_balancing_enabled             = var.zone_redundant

  tags = var.tags
}
