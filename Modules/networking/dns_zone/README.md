# dns_zone

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_records"></a> [records](#module\_records) | ./records | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [random_string.dns_zone_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | n/a | `any` | n/a | yes |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group where to create the resource. | `string` | n/a | yes |
| <a name="input_resource_ids"></a> [resource\_ids](#input\_resource\_ids) | n/a | `map` | `{}` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | DNS Zone resource ID. |
| <a name="output_max_number_of_record_sets"></a> [max\_number\_of\_record\_sets](#output\_max\_number\_of\_record\_sets) | Maximum number of Records in the zone. |
| <a name="output_name"></a> [name](#output\_name) | The fully qualified domain name of the Record Set. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | A list of values that make up the NS record for the zone. |
| <a name="output_records"></a> [records](#output\_records) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name of the dns\_zone |
| <a name="output_soa_record"></a> [soa\_record](#output\_soa\_record) | The SOA record. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
