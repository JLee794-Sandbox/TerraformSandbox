# container

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_blob"></a> [blob](#module\_blob) | ../blob | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_container.stg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `any` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_blobs"></a> [blobs](#output\_blobs) | Exports the content of the blob module. |
| <a name="output_has_immutability_policy"></a> [has\_immutability\_policy](#output\_has\_immutability\_policy) | Is there an Immutability Policy configured on this Storage Container? |
| <a name="output_has_legal_hold"></a> [has\_legal\_hold](#output\_has\_legal\_hold) | Is there a Legal Hold configured on this Storage Container? |
| <a name="output_id"></a> [id](#output\_id) | The Resource Manager ID of this Storage Container. Used by role\_mapping |
| <a name="output_name"></a> [name](#output\_name) | The ID of the Storage Container. |
| <a name="output_resource_manager_id"></a> [resource\_manager\_id](#output\_resource\_manager\_id) | The Resource Manager ID of this Storage Container. |
| <a name="output_url"></a> [url](#output\_url) | The Resource Manager ID (URL) of this Storage Container. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
