# Name of the VM in the Azure Control Plane
resource "azurecaf_name" "linux" {
  name          = var.name
  resource_type = "azurerm_linux_virtual_machine"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

# Create network interface
resource "azurecaf_name" "nic" {
  name          = var.name
  resource_type = "azurerm_network_interface"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_network_interface" "this" {
  name                = azurecaf_name.nic.result
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "dynamic-private-ip-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = local.tags
}

# TODO: Make vm Windows for SP
# Create virtual machine
resource "azurerm_linux_virtual_machine" "this" {
  name                  = azurecaf_name.linux.result
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.this.id]
  size                  = var.size

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.os_disk_size_gb
  }

  # source_image_reference = var.source_image_reference
  dynamic "source_image_reference" {
    for_each = var.source_image_reference != null || var.source_image_reference != {} ? [1] : []

    content {
      publisher = var.source_image_reference.publisher
      offer     = var.source_image_reference.offer
      sku       = var.source_image_reference.sku
      version   = var.source_image_reference.version
    }
  }

  computer_name                   = azurecaf_name.linux.result
  admin_username                  = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.ssh.public_key_openssh
  }
  tags = local.tags
}
