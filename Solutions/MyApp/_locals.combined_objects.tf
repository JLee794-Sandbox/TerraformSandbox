locals {
  ###############################
  # Consolidated objects to allow for more complex, dynamic deployments
  #  with the ability to reference objects from other landing zones
  ###############################
  resource_groups = {
    app_rg = module.resource_group
  }
  storage_accounts = {
    sa1 = module.storage_account
  }
}
