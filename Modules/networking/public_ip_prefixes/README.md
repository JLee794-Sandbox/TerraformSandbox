# public_ip_prefixes

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip_prefix.pip_prefix](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip_prefix) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| <a name="input_create_pips"></a> [create\_pips](#input\_create\_pips) | (Optional) When true all IP's will be created and provided as output. | `bool` | `false` | no |
| <a name="input_diagnostic_profiles"></a> [diagnostic\_profiles](#input\_diagnostic\_profiles) | (Optional) Diagnostics profile settings to be deployed for the resource. | `map` | `{}` | no |
| <a name="input_diagnostics"></a> [diagnostics](#input\_diagnostics) | (Optional) Diagnostics objects where to deploy the diagnostics profiles. | `map` | `{}` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | (Optional) The IP Version to use, IPv6 or IPv4. | `string` | `"IPv4"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Public IP Prefix resource . Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_pip_settings"></a> [pip\_settings](#input\_pip\_settings) | (Optional) PIP settings when create\_ips = true. | `map` | `{}` | no |
| <a name="input_prefix_length"></a> [prefix\_length](#input\_prefix\_length) | (Optional) Specifies the number of bits of the prefix. The value can be set between 0 (4,294,967,296 addresses) and 31 (2 addresses). Defaults to 28(16 addresses). Changing this forces a new resource to be created. | `string` | `28` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group where to create the resource. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Basic"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags for the resource to be deployed. | `map(any)` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | (Optional) The availability zone to allocate the Public IP in. Possible values are Zone-Redundant, 1, 2, 3, and No-Zone. Defaults to Zone-Redundant. | `string` | `"Zone-Redundant"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Public IP Prefix ID. |
| <a name="output_ip_prefix"></a> [ip\_prefix](#output\_ip\_prefix) | The IP address prefix that was allocated. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
