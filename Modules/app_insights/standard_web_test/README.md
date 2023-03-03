# standard_web_test

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.3.0 |
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 1.2.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.appiwt](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azurecaf_name.appiwt](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_insights_id"></a> [application\_insights\_id](#input\_application\_insights\_id) | (Required) The ID of the Application Insights component on which the WebTest operates. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | `{}` | no |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object when the resource is deploye in landing zones context. | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. It needs to correlate with location of parent resource (azurerm\_application\_insights). | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Application Insights WebTest. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | (Required) The id of the resource group in which to create the Application Insights WebTest. Changing this forces a new resource. | `any` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Application Insights standard web test. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
