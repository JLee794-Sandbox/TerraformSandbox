# storage_account

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 1.2.23 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_container"></a> [container](#module\_container) | ./container | n/a |
| <a name="module_data_lake_filesystem"></a> [data\_lake\_filesystem](#module\_data\_lake\_filesystem) | ./data_lake_filesystem | n/a |
| <a name="module_diagnostics"></a> [diagnostics](#module\_diagnostics) | ../diagnostics | n/a |
| <a name="module_diagnostics_blob"></a> [diagnostics\_blob](#module\_diagnostics\_blob) | ../diagnostics | n/a |
| <a name="module_diagnostics_file"></a> [diagnostics\_file](#module\_diagnostics\_file) | ../diagnostics | n/a |
| <a name="module_diagnostics_queue"></a> [diagnostics\_queue](#module\_diagnostics\_queue) | ../diagnostics | n/a |
| <a name="module_diagnostics_table"></a> [diagnostics\_table](#module\_diagnostics\_table) | ../diagnostics | n/a |
| <a name="module_file_share"></a> [file\_share](#module\_file\_share) | ./file_share | n/a |
| <a name="module_management_policy"></a> [management\_policy](#module\_management\_policy) | ./management_policy | n/a |
| <a name="module_private_endpoint"></a> [private\_endpoint](#module\_private\_endpoint) | ../networking/private_endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.stg](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_backup_container_storage_account.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_container_storage_account) | resource |
| [azurerm_storage_account.stg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | n/a | `map` | `{}` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client configuration object (see module README.md). | `any` | n/a | yes |
| <a name="input_diagnostic_profiles"></a> [diagnostic\_profiles](#input\_diagnostic\_profiles) | n/a | `map` | `{}` | no |
| <a name="input_diagnostic_profiles_blob"></a> [diagnostic\_profiles\_blob](#input\_diagnostic\_profiles\_blob) | n/a | `map` | `{}` | no |
| <a name="input_diagnostic_profiles_file"></a> [diagnostic\_profiles\_file](#input\_diagnostic\_profiles\_file) | n/a | `map` | `{}` | no |
| <a name="input_diagnostic_profiles_queue"></a> [diagnostic\_profiles\_queue](#input\_diagnostic\_profiles\_queue) | n/a | `map` | `{}` | no |
| <a name="input_diagnostic_profiles_table"></a> [diagnostic\_profiles\_table](#input\_diagnostic\_profiles\_table) | n/a | `map` | `{}` | no |
| <a name="input_diagnostics"></a> [diagnostics](#input\_diagnostics) | n/a | `map` | `{}` | no |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities) | n/a | `map` | `{}` | no |
| <a name="input_private_dns"></a> [private\_dns](#input\_private\_dns) | n/a | `map` | `{}` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | n/a | `map` | `{}` | no |
| <a name="input_recovery_vaults"></a> [recovery\_vaults](#input\_recovery\_vaults) | n/a | `map` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group where to create the resource. | `string` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | n/a | `map` | `{}` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | n/a | `any` | n/a | yes |
| <a name="input_vnets"></a> [vnets](#input\_vnets) | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_container_id"></a> [backup\_container\_id](#output\_backup\_container\_id) | The ID of the Backup Storage Account Container |
| <a name="output_containers"></a> [containers](#output\_containers) | The containers output objects as created by the container submodule. |
| <a name="output_data_lake_filesystems"></a> [data\_lake\_filesystems](#output\_data\_lake\_filesystems) | The data lake filesystem output objects as created by the data lake filesystem submodule. |
| <a name="output_file_share"></a> [file\_share](#output\_file\_share) | The file shares output objects as created by the file shares submodule. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Account |
| <a name="output_identity"></a> [identity](#output\_identity) | An identity block, which contains the Identity information for this Storage Account. Exports principal\_id (The Principal ID for the Service Principal associated with the Identity of this Storage Account), tenand\_id (The Tenant ID for the Service Principal associated with the Identity of this Storage Account) |
| <a name="output_location"></a> [location](#output\_location) | The location of the Storage Account |
| <a name="output_name"></a> [name](#output\_name) | The name of the Storage Account |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The endpoint URL for blob storage in the primary location. |
| <a name="output_primary_blob_connection_string"></a> [primary\_blob\_connection\_string](#output\_primary\_blob\_connection\_string) | n/a |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | The endpoint URL for blob storage in the primary location. |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | n/a |
| <a name="output_primary_web_host"></a> [primary\_web\_host](#output\_primary\_web\_host) | The hostname with port if applicable for web storage in the primary location. |
| <a name="output_rbac_id"></a> [rbac\_id](#output\_rbac\_id) | The Principal ID for the Service Principal associated with the Identity of this Storage Account. (Extracted from the identity block) |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The resource group name of the Storage Account |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
