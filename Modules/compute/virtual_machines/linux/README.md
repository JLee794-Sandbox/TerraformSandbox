# linux

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 1.2.23 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.2.3 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nics"></a> [nics](#module\_nics) | ../../../diagnostics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.disk](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.linux](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.linux_computer_name](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.nic](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.os_disk_linux](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_backup_protected_vm.backup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_vm) | resource |
| [azurerm_dev_test_global_vm_shutdown_schedule.enabled](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule) | resource |
| [azurerm_key_vault_secret.ssh_private_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.ssh_public_key_openssh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_managed_disk.disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nic_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_virtual_machine_data_disk_attachment.disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [external_external.secret_key_id](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.ssh_public_key_id](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.ssh_secret_keyvault](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_security_groups"></a> [application\_security\_groups](#input\_application\_security\_groups) | n/a | `map` | `{}` | no |
| <a name="input_availability_sets"></a> [availability\_sets](#input\_availability\_sets) | n/a | `map` | `{}` | no |
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| <a name="input_boot_diagnostics_storage_account"></a> [boot\_diagnostics\_storage\_account](#input\_boot\_diagnostics\_storage\_account) | (Optional) The Primary/Secondary Endpoint for the Azure Storage Account (general purpose) which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. | `any` | `null` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client configuration object (see module README.md). | `any` | n/a | yes |
| <a name="input_custom_image_ids"></a> [custom\_image\_ids](#input\_custom\_image\_ids) | n/a | `map` | `{}` | no |
| <a name="input_dedicated_hosts"></a> [dedicated\_hosts](#input\_dedicated\_hosts) | n/a | `map` | `{}` | no |
| <a name="input_diagnostics"></a> [diagnostics](#input\_diagnostics) | n/a | `map` | `{}` | no |
| <a name="input_disk_encryption_sets"></a> [disk\_encryption\_sets](#input\_disk\_encryption\_sets) | n/a | `map` | `{}` | no |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_image_definitions"></a> [image\_definitions](#input\_image\_definitions) | n/a | `map` | `{}` | no |
| <a name="input_keyvault"></a> [keyvault](#input\_keyvault) | Keyvault to store the SSH public and private keys when not provided by the var.public\_key\_pem\_file or retrieve admin username and password | `string` | `""` | no |
| <a name="input_keyvaults"></a> [keyvaults](#input\_keyvaults) | Keyvault to store the SSH public and private keys when not provided by the var.public\_key\_pem\_file or retrieve admin username and password | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities) | n/a | `map` | `{}` | no |
| <a name="input_network_security_groups"></a> [network\_security\_groups](#input\_network\_security\_groups) | Require a version 1 NSG definition to be attached to a nic. | `map` | `{}` | no |
| <a name="input_proximity_placement_groups"></a> [proximity\_placement\_groups](#input\_proximity\_placement\_groups) | n/a | `map` | `{}` | no |
| <a name="input_public_ip_addresses"></a> [public\_ip\_addresses](#input\_public\_ip\_addresses) | n/a | `map` | `{}` | no |
| <a name="input_public_key_pem_file"></a> [public\_key\_pem\_file](#input\_public\_key\_pem\_file) | If disable\_password\_authentication is set to true, ssh authentication is enabled. You can provide a list of file path of the public ssh key in PEM format. If left blank a new RSA/4096 key is created and the key is stored in the keyvault\_id. The secret name being the {computer name}-ssh-public and {computer name}-ssh-private | `string` | `""` | no |
| <a name="input_recovery_vaults"></a> [recovery\_vaults](#input\_recovery\_vaults) | n/a | `map` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the existing resource group to deploy the virtual machine | `any` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `any` | n/a | yes |
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | n/a | `map` | `{}` | no |
| <a name="input_virtual_machines"></a> [virtual\_machines](#input\_virtual\_machines) | n/a | `map` | `{}` | no |
| <a name="input_vnets"></a> [vnets](#input\_vnets) | n/a | `map` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
