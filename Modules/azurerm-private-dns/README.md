# azurerm-private-dns

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
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns-zone-to-vnet-link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | (Required) Fully qualified domain name for the Private DNS Zone | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location to deploy resources to. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of the resource group in which to create the MySQL Server | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource | `map(string)` | <pre>{<br>  "pe_enable": true<br>}</pre> | no |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | (Optional) The ID of the virtual network to associate the Private DNS Zone with. Either vnet\_id or vnet\_name must be specified. | `string` | `""` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | (Optional) The Name of the virtual network to associate the Private DNS Zone with. | `string` | `""` | no |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | (Optional) If the virtual network is in a different resource group, specify the name of the resource group here. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_max_number_of_record_sets"></a> [max\_number\_of\_record\_sets](#output\_max\_number\_of\_record\_sets) | n/a |
| <a name="output_max_number_of_virtual_network_links"></a> [max\_number\_of\_virtual\_network\_links](#output\_max\_number\_of\_virtual\_network\_links) | n/a |
| <a name="output_max_number_of_virtual_network_links_with_registration"></a> [max\_number\_of\_virtual\_network\_links\_with\_registration](#output\_max\_number\_of\_virtual\_network\_links\_with\_registration) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_soa_record"></a> [soa\_record](#output\_soa\_record) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
