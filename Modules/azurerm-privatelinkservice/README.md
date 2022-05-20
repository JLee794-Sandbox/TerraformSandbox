# azurerm-privatelinkservice

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_link_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_link_service) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_approval_subscription_ids"></a> [auto\_approval\_subscription\_ids](#input\_auto\_approval\_subscription\_ids) | (Optional) A list of Subscription UUID/GUID's that will be automatically be able to use this Private Link Service. | `list(string)` | `[]` | no |
| <a name="input_load_balancer_frontend_ip_configuration_ids"></a> [load\_balancer\_frontend\_ip\_configuration\_ids](#input\_load\_balancer\_frontend\_ip\_configuration\_ids) | (Required) A list of Frontend IP Configuration ID's from a Standard Load Balancer, where traffic from the Private Link Service should be routed. You can use Load Balancer Rules to direct this traffic to appropriate backend pools where your applications are running. | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure Region where the Private Link Service should be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the private link service. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_nat_ip_configurations"></a> [nat\_ip\_configurations](#input\_nat\_ip\_configurations) | (Required) One or more (up to 8) nat\_ip\_configuration block as defined below. | `map(any)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the private link service. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Specifies the tags to assign to the resource. Changing this forces a new resource to be created. | `map(string)` | `null` | no |
| <a name="input_visibility_subscription_ids"></a> [visibility\_subscription\_ids](#input\_visibility\_subscription\_ids) | (Optional) A list of Subscription UUID/GUID's that will be able to see this Private Link Service. | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
