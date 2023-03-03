# diagnostics

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
| [azurerm_monitor_diagnostic_setting.diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_diagnostics"></a> [diagnostics](#input\_diagnostics) | (Required) Contains the diagnostics setting object. | `any` | n/a | yes |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `map` | `{}` | no |
| <a name="input_profiles"></a> [profiles](#input\_profiles) | n/a | `any` | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | (Required) Fully qualified Azure resource identifier for which you enable diagnostics. | `any` | n/a | yes |
| <a name="input_resource_location"></a> [resource\_location](#input\_resource\_location) | (Required) location of the resource | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
