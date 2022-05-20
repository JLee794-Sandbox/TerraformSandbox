# azurerm-private-endpoint

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
| [azurerm_private_dns_a_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint_connection.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_endpoint_connection) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required) The location to deploy resources to. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Azure SQL Server | `string` | n/a | yes |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | (Required) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. | `string` | n/a | yes |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | (Required) The location to deploy resources to. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of the resource group in which to create the MySQL Server | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | (Optional) A list of subresource names which the Private Endpoint is able to connect to. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource | `map(string)` | <pre>{<br>  "pe_enable": true<br>}</pre> | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | (Optional) The time to live for each connection to the private\_dns\_zone. | `string` | `"300"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | (Optional) The Name of the virtual network to associate the Private DNS Zone with. | `string` | `""` | no |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | (Optional) If the virtual network is in a different resource group, specify the name of the resource group here. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_record_fqdn"></a> [dns\_a\_record\_fqdn](#output\_dns\_a\_record\_fqdn) | n/a |
| <a name="output_dns_a_record_id"></a> [dns\_a\_record\_id](#output\_dns\_a\_record\_id) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
