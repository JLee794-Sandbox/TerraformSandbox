# networksecuritygroup

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
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | (Optional) Additional tags to associate to each nsg created. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location to deploy resources to. | `string` | n/a | yes |
| <a name="input_network_security_groups"></a> [network\_security\_groups](#input\_network\_security\_groups) | The network security groups with their properties. | <pre>map(object({<br>    name                      = string<br>    tags                      = map(string)<br>    subnet_name               = string<br>    vnet_name                 = string<br>    networking_resource_group = string<br>    security_rules = list(object({<br>      name                                         = string<br>      description                                  = string<br>      protocol                                     = string<br>      direction                                    = string<br>      access                                       = string<br>      priority                                     = number<br>      source_address_prefix                        = string<br>      source_address_prefixes                      = list(string)<br>      destination_address_prefix                   = string<br>      destination_address_prefixes                 = list(string)<br>      source_port_range                            = string<br>      source_port_ranges                           = list(string)<br>      destination_port_range                       = string<br>      destination_port_ranges                      = list(string)<br>      source_application_security_group_names      = list(string)<br>      destination_application_security_group_names = list(string)<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the NSGs. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_security_group_ids"></a> [network\_security\_group\_ids](#output\_network\_security\_group\_ids) | n/a |
| <a name="output_nsg_id_map"></a> [nsg\_id\_map](#output\_nsg\_id\_map) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
