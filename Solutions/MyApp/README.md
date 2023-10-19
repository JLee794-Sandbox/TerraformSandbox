# myApp

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.36.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.49.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_insights"></a> [app\_insights](#module\_app\_insights) | ../../Modules/app_insights | n/a |
| <a name="module_appservice_plan"></a> [appservice\_plan](#module\_appservice\_plan) | ../../Modules/webapps/asp | n/a |
| <a name="module_frontdoor"></a> [frontdoor](#module\_frontdoor) | ../../Modules/networking/azurerm-frontdoor | n/a |
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ../../Modules/security/keyvault | n/a |
| <a name="module_linux_webapp"></a> [linux\_webapp](#module\_linux\_webapp) | ../../Modules/webapps/linux_appservice | n/a |
| <a name="module_mssql_dbs"></a> [mssql\_dbs](#module\_mssql\_dbs) | ../../Modules/databases/mssql_database | n/a |
| <a name="module_mssql_private_endpoint"></a> [mssql\_private\_endpoint](#module\_mssql\_private\_endpoint) | ../../Modules/networking/private_endpoint | n/a |
| <a name="module_mssql_server"></a> [mssql\_server](#module\_mssql\_server) | ../../Modules/databases/mssql_server | n/a |
| <a name="module_private_dns"></a> [private\_dns](#module\_private\_dns) | ../../Modules/networking/private-dns | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../../Modules/resource_group | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../Modules/storage_account | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_group.admins](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subnet.data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subnet.devops](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subnet.serverfarm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.app_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | (Required) administrator login for the server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_application_fs_level"></a> [application\_fs\_level](#input\_application\_fs\_level) | (Optional) The level of FILESYSTEM logging to enable for the App Service. Possible values are Information, Warning, Error, and Verbose. Defaults to Error. | `string` | `"Error"` | no |
| <a name="input_application_log_level"></a> [application\_log\_level](#input\_application\_log\_level) | (Optional) The level of logging to enable for the App Service. Possible values are Information, Warning, Error, and Verbose. Defaults to Error. | `string` | `"Error"` | no |
| <a name="input_application_log_retention_in_days"></a> [application\_log\_retention\_in\_days](#input\_application\_log\_retention\_in\_days) | (Optional) Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90. | `number` | `90` | no |
| <a name="input_application_log_sas_url_expiry_in_hours"></a> [application\_log\_sas\_url\_expiry\_in\_hours](#input\_application\_log\_sas\_url\_expiry\_in\_hours) | (Optional) The SAS URL Expiry in Hours for the Application Log (max 8640h). Defaults to 24h. | `string` | `"24h"` | no |
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | (Required) Product/Application name which will be appended as a suffix. | `string` | n/a | yes |
| <a name="input_appservice_plan_sku_name"></a> [appservice\_plan\_sku\_name](#input\_appservice\_plan\_sku\_name) | (Required) The Name of the SKU for the App Service Plan. Possible values  include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1. | `string` | `"S2"` | no |
| <a name="input_azuread_group_id"></a> [azuread\_group\_id](#input\_azuread\_group\_id) | (Optional) The Azure AD Group ID to use for the App Service Plan | `string` | `null` | no |
| <a name="input_azuread_group_name"></a> [azuread\_group\_name](#input\_azuread\_group\_name) | (Optional) Display Name of the AAD Security Group to own the deployed resources. | `string` | `null` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | (Optional) Client configuration object. | `map(any)` | `{}` | no |
| <a name="input_country_code"></a> [country\_code](#input\_country\_code) | (Required) Short country code to use for the name (eg. eu for europe, na for north america) | `string` | n/a | yes |
| <a name="input_data_subnet_name"></a> [data\_subnet\_name](#input\_data\_subnet\_name) | Name of the subnet to host the SQL Server private networking resources | `string` | n/a | yes |
| <a name="input_databases"></a> [databases](#input\_databases) | (Optional) Map of databases to create on the server. | `map` | `{}` | no |
| <a name="input_devops_subnet_name"></a> [devops\_subnet\_name](#input\_devops\_subnet\_name) | Name of the subnet the DevOps deployment vm will be deploying resources from | `string` | n/a | yes |
| <a name="input_docker_image"></a> [docker\_image](#input\_docker\_image) | (Optional) The Docker image to use for the App Service. | `string` | `null` | no |
| <a name="input_docker_image_tag"></a> [docker\_image\_tag](#input\_docker\_image\_tag) | (Optional) The Image Tag to use for the Docker image. | `string` | `null` | no |
| <a name="input_dotnet_version"></a> [dotnet\_version](#input\_dotnet\_version) | (Optional) The version of .NET to use. Possible values include 3.1, 5.0, 6.0 and 7.0. | `string` | `null` | no |
| <a name="input_environment_code"></a> [environment\_code](#input\_environment\_code) | (Required) Numerical representation of the environment | `string` | n/a | yes |
| <a name="input_java_server"></a> [java\_server](#input\_java\_server) | (Optional) The Java Server to use for the App Service. Possible values include Tomcat and Jetty. | `string` | `null` | no |
| <a name="input_java_version"></a> [java\_version](#input\_java\_version) | (Optional) The Version of Java to use. Possible values include 8, 11, and 17. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) location - example: South Central US = southcentralus | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | (Required) Email or ID of the owner for the resource. | `string` | n/a | yes |
| <a name="input_prefixes"></a> [prefixes](#input\_prefixes) | (Optional) Prefixes to set for the resource names. Defaults to 'az'. | `list(string)` | <pre>[<br>  "az"<br>]</pre> | no |
| <a name="input_private_dns_fqdn"></a> [private\_dns\_fqdn](#input\_private\_dns\_fqdn) | The FQDN of the private DNS zone to use for the App Service Plan | `string` | n/a | yes |
| <a name="input_remote_objects"></a> [remote\_objects](#input\_remote\_objects) | (Optional) Objects from other landing zones that are required for this deployment. | `map(any)` | `{}` | no |
| <a name="input_serverfarm_subnet_name"></a> [serverfarm\_subnet\_name](#input\_serverfarm\_subnet\_name) | Name of the subnet with the serverfarm designation to host the App Service Plan private networking resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Additional tags to apply to the resource. | `map(any)` | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Resource Name for the existing VNet to use for this deployment | `string` | n/a | yes |
| <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name) | Resource Group Name for the existing VNet to use for this deployment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appservice_plan"></a> [appservice\_plan](#output\_appservice\_plan) | n/a |
| <a name="output_frontdoor"></a> [frontdoor](#output\_frontdoor) | n/a |
| <a name="output_keyvault_name"></a> [keyvault\_name](#output\_keyvault\_name) | n/a |
| <a name="output_linux_webapp"></a> [linux\_webapp](#output\_linux\_webapp) | n/a |
| <a name="output_mssql_dbs"></a> [mssql\_dbs](#output\_mssql\_dbs) | n/a |
| <a name="output_mssql_private_endpoint"></a> [mssql\_private\_endpoint](#output\_mssql\_private\_endpoint) | n/a |
| <a name="output_mssql_server"></a> [mssql\_server](#output\_mssql\_server) | n/a |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
