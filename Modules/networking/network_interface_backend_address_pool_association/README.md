module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.1.0"
}

# network_interface_backend_address_pool_association

## Inputs
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
|network_interface|The `network_interface` block as defined below.|Block|True|
|ip_configuration_name| The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool. Changing this forces a new resource to be created.||True|
|backend_address_pool_id| The ID of the Load Balancer Backend Address Pool which this Network Interface should be connected to. Changing this forces a new resource to be created.||True|

## Blocks
| Block | Argument | Description | Required |
|-------|----------|-------------|----------|
|network_interface| key | Key for  network_interface||| Required if  |
|network_interface| lz_key |Landing Zone Key in wich the network_interface is located|||True|
|network_interface| id | The id of the network_interface |||True|

## Outputs
| Name | Description |
|------|-------------|
|id|The (Terraform specific) ID of the Association between the Network Interface and the Load Balancers Backend Address Pool.|||
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface_backend_address_pool_association.nibapa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_address_pool_id"></a> [backend\_address\_pool\_id](#input\_backend\_address\_pool\_id) | The ID of the variable backend address pool. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | `{}` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client configuration object (see module README.md). | `any` | n/a | yes |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | The name of the NIC ip configuration. | `any` | n/a | yes |
| <a name="input_network_interface_id"></a> [network\_interface\_id](#input\_network\_interface\_id) | The ID of the Network Interface. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_remote_objects"></a> [remote\_objects](#input\_remote\_objects) | (Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created. | `map` | `{}` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | (Required) Used to handle passthrough paramenters. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The (Terraform specific) ID of the Association between the Network Interface and the Load Balancers Backend Address Pool. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
