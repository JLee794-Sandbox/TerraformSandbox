name                = "tftest-ilb"
resource_group_name = "validation-rg"
location            = "eastus"

sku      = "Standard"
sku_tier = "Regional"

frontend_ip_configurations = {
  DynamicPrivateIPAddress = {
    private_ip_address_allocation = "Dynamic"
    zones                         = []
    private_ip_address_version    = "IPv4"
    subnet_id                     = ""
  }
}
