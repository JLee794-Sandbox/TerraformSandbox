# -
# - Create App Service
# -
resource "azurerm_linux_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {}

  // TODO: review config items with team
  //  https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app
  // application_stack {
  //   // docker_image = var.docker_image
  //   // docker_image_tag = var.docker_image_tag
  //   // dotnet_version = "6.0"
  // }
  // action {}
  // active_directory {}
  // application_logs {}
  // site_config {}
  // slow_request {}
  // status_code {}
  // sticky_settings {}
  // storage_account {}
  // trigger {}
  // auth_settings {}
  // auto_heal_setting {}
  // azure_blob_storage {}
  // backup {}
  // cors {}

  tags = var.tags
}
