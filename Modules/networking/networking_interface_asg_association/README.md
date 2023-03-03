# networking_interface_asg_association

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
| [azurerm_network_interface_application_security_group_association.asg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_application_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_security_group_id"></a> [application\_security\_group\_id](#input\_application\_security\_group\_id) | n/a | `map` | `{}` | no |
| <a name="input_application_security_groups"></a> [application\_security\_groups](#input\_application\_security\_groups) | n/a | `map` | `{}` | no |
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client configuration object (see module README.md). | `any` | n/a | yes |
| <a name="input_existing_resources"></a> [existing\_resources](#input\_existing\_resources) | n/a | `map` | `{}` | no |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_interface_id"></a> [network\_interface\_id](#input\_network\_interface\_id) | n/a | `map` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the existing resource group to deploy the virtual machine | `any` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `map` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
