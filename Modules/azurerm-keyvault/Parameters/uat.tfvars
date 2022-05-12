name                = "kv-uat01"
location            = "eastus2"
resource_group_name = "validation-rg"
sku_name            = "Standard"
access_policy = {
  object_id               = "00000000-0000-0000-0000-000000000000"
  certificate_permissions = []
  key_permissions         = []
  secret_permissions      = ["Get"]
}
