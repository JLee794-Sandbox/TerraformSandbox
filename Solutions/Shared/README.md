# Shared

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.44.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.35.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ../../Modules/security/keyvault | n/a |
| <a name="module_linux_devops_vm"></a> [linux\_devops\_vm](#module\_linux\_devops\_vm) | ../../Modules/compute/virtual_machines/linux_devops | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../../Modules/resource_group | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_group.admins](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subnet.devops](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [http_http.ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | (Required) Product/Application name which will be appended as a suffix. | `string` | n/a | yes |
| <a name="input_azuread_group_id"></a> [azuread\_group\_id](#input\_azuread\_group\_id) | (Optional) The Azure AD Group ID to use for the App Service Plan | `string` | `null` | no |
| <a name="input_azuread_group_name"></a> [azuread\_group\_name](#input\_azuread\_group\_name) | (Optional) Display Name of the AAD Security Group to own the deployed resources. | `string` | `null` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | (Optional) Client configuration object. | `map` | `{}` | no |
| <a name="input_country_code"></a> [country\_code](#input\_country\_code) | (Required) Short country code to use for the name (eg. eu for europe, na for north america) | `string` | n/a | yes |
| <a name="input_devops_subnet_name"></a> [devops\_subnet\_name](#input\_devops\_subnet\_name) | Name of the subnet the DevOps deployment vm will be deploying resources from | `string` | n/a | yes |
| <a name="input_devops_vm_admin_username"></a> [devops\_vm\_admin\_username](#input\_devops\_vm\_admin\_username) | [REQUIRED] Admin username to use for ssh access to the devops vm. | `string` | n/a | yes |
| <a name="input_environment_code"></a> [environment\_code](#input\_environment\_code) | (Required) Numerical representation of the environment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) location - example: South Central US = southcentralus | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | (Required) Email or ID of the owner for the resource. | `string` | n/a | yes |
| <a name="input_prefixes"></a> [prefixes](#input\_prefixes) | (Optional) Prefixes to set for the resource names. Defaults to 'az'. | `list(string)` | <pre>[<br>  "az"<br>]</pre> | no |
| <a name="input_remote_objects"></a> [remote\_objects](#input\_remote\_objects) | (Optional) Objects from other landing zones that are required for this deployment. | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Additional tags to apply to the resource. | `map(any)` | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Resource Name for the existing VNet to use for this deployment | `string` | n/a | yes |
| <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name) | Resource Group Name for the existing VNet to use for this deployment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_linux_devops_vm_id"></a> [linux\_devops\_vm\_id](#output\_linux\_devops\_vm\_id) | n/a |
| <a name="output_linux_devops_vm_identity"></a> [linux\_devops\_vm\_identity](#output\_linux\_devops\_vm\_identity) | n/a |
| <a name="output_linux_devops_vm_name"></a> [linux\_devops\_vm\_name](#output\_linux\_devops\_vm\_name) | n/a |
| <a name="output_linux_devops_vm_private_ip_address"></a> [linux\_devops\_vm\_private\_ip\_address](#output\_linux\_devops\_vm\_private\_ip\_address) | n/a |
| <a name="output_linux_devops_vm_public_ip_address"></a> [linux\_devops\_vm\_public\_ip\_address](#output\_linux\_devops\_vm\_public\_ip\_address) | n/a |
| <a name="output_linux_devops_vm_virtual_machine_id"></a> [linux\_devops\_vm\_virtual\_machine\_id](#output\_linux\_devops\_vm\_virtual\_machine\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
