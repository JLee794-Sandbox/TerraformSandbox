# keyvault_certificate_request

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_certificate.csr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_certificate) | resource |
| [null_resource.cancel_order_global_sign](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [azurerm_key_vault_secret.password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_issuers"></a> [certificate\_issuers](#input\_certificate\_issuers) | n/a | `map` | `{}` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client Config | `map(any)` | n/a | yes |
| <a name="input_domain_name_registrations"></a> [domain\_name\_registrations](#input\_domain\_name\_registrations) | n/a | `map` | `{}` | no |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | n/a | `any` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_attribute"></a> [certificate\_attribute](#output\_certificate\_attribute) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_keyvault_id"></a> [keyvault\_id](#output\_keyvault\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_secret_id"></a> [secret\_id](#output\_secret\_id) | n/a |
| <a name="output_thumbprint"></a> [thumbprint](#output\_thumbprint) | n/a |
| <a name="output_version"></a> [version](#output\_version) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
