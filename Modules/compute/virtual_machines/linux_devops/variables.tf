variable "name" {
  description = "[REQUIRED] The name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "[REQUIRED] The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "location" {
  description = "[REQUIRED] The Azure location where the virtual machine should be created."
  type        = string
}

variable "admin_username" {
  description = "[REQUIRED] The admin username for the virtual machine."
  type        = string
}

variable "key_vault" {
  description = "[REQUIRED] The key vault object map to use for secrets."
}

variable "subnet_id" {
  description = "[REQUIRED] The subnet ID in which to create the virtual machine."
}

variable "size" {
  description = "[OPTIONAL] The size of the virtual machine."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "source_image_reference" {
  description = "[OPTIONAL] The source image used to create the virtual machine."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

variable "os_disk_size_gb" {
  description = "[OPTIONAL] The OS disk size in GB for the virtual machine."
  type        = number
  default     = 50
}

variable "global_settings" {
}
variable "base_tags" {

}

variable "use_azurecaf_name" {
  description = "[OPTIONAL] Use Azure CAF naming convention for resources."
  type        = bool
  default     = true
}
