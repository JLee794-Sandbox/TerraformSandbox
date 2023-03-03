# linux_appservice

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 1.2.23 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.45.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.9.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_diagnostics"></a> [diagnostics](#module\_diagnostics) | ../../diagnostics | n/a |
| <a name="module_private_endpoint"></a> [private\_endpoint](#module\_private\_endpoint) | ../../networking/private_endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.app_service](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_app_service_custom_hostname_binding.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_custom_hostname_binding) | resource |
| [azurerm_app_service_source_control.app_scm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_source_control) | resource |
| [azurerm_linux_web_app.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot.slots](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [time_rotating.http_logs_sas](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [time_rotating.logs_sas](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [time_rotating.sas](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [azurerm_storage_account.backup_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_account_blob_container_sas.backup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_blob_container_sas) | data source |
| [azurerm_storage_account_blob_container_sas.http_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_blob_container_sas) | data source |
| [azurerm_storage_account_blob_container_sas.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_blob_container_sas) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | n/a | `any` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | n/a | `any` | `null` | no |
| <a name="input_application_insight"></a> [application\_insight](#input\_application\_insight) | n/a | `any` | `null` | no |
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client configuration object (see module README.md). | `any` | n/a | yes |
| <a name="input_combined_objects"></a> [combined\_objects](#input\_combined\_objects) | n/a | `map` | `{}` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | n/a | `map` | `{}` | no |
| <a name="input_diagnostic_profiles"></a> [diagnostic\_profiles](#input\_diagnostic\_profiles) | n/a | `map` | `{}` | no |
| <a name="input_diagnostics"></a> [diagnostics](#input\_diagnostics) | n/a | `any` | `null` | no |
| <a name="input_dynamic_app_settings"></a> [dynamic\_app\_settings](#input\_dynamic\_app\_settings) | n/a | `map` | `{}` | no |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_identity"></a> [identity](#input\_identity) | n/a | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Resource Location | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the App Service | `any` | n/a | yes |
| <a name="input_private_dns"></a> [private\_dns](#input\_private\_dns) | n/a | `map` | `{}` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | variable "subnet\_id" {} | `map` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Resource group of the App Service | `any` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `any` | n/a | yes |
| <a name="input_slots"></a> [slots](#input\_slots) | n/a | `map` | `{}` | no |
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | n/a | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) map of tags for the deployment | `any` | n/a | yes |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | (Optional) The subnet id which will be used by this Web App for regional virtual network integration. | `any` | `null` | no |
| <a name="input_vnets"></a> [vnets](#input\_vnets) | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The Default Hostname associated with the App Service |
| <a name="output_id"></a> [id](#output\_id) | The ID of the App Service. |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses. not all of which are necessarily in use |
| <a name="output_rbac_id"></a> [rbac\_id](#output\_rbac\_id) | The Principal ID of the App Service. |
| <a name="output_slot"></a> [slot](#output\_slot) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
