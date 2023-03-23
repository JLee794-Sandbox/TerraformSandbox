# linux_devops

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 1.2.23 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.linux](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.nic](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_key_vault_secret.ssh_private_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.ssh_public_key_openssh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | [REQUIRED] The admin username for the virtual machine. | `string` | n/a | yes |
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | n/a | `any` | n/a | yes |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_key_vault"></a> [key\_vault](#input\_key\_vault) | [REQUIRED] The key vault object map to use for secrets. | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | [REQUIRED] The Azure location where the virtual machine should be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | [REQUIRED] The name of the virtual machine. | `string` | n/a | yes |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | [OPTIONAL] The OS disk size in GB for the virtual machine. | `number` | `50` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | [REQUIRED] The name of the resource group in which to create the virtual machine. | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | [OPTIONAL] The size of the virtual machine. | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | [OPTIONAL] The source image used to create the virtual machine. | <pre>object({<br>    publisher = string<br>    offer     = string<br>    sku       = string<br>    version   = string<br>  })</pre> | <pre>{<br>  "offer": "0001-com-ubuntu-server-focal",<br>  "publisher": "Canonical",<br>  "sku": "20_04-lts-gen2",<br>  "version": "latest"<br>}</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | [REQUIRED] The subnet ID in which to create the virtual machine. | `any` | n/a | yes |
| <a name="input_use_azurecaf_name"></a> [use\_azurecaf\_name](#input\_use\_azurecaf\_name) | [OPTIONAL] Use Azure CAF naming convention for resources. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | n/a |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
| <a name="output_virtual_machine_id"></a> [virtual\_machine\_id](#output\_virtual\_machine\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
