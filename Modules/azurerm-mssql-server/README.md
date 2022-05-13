# azurerm-azsql

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.azuresql_keyvault_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_mssql_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login_name"></a> [administrator\_login\_name](#input\_administrator\_login\_name) | (Optional) The administrator username of Azure SQL Server | `string` | `"dbadmin"` | no |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | (Optional) The administrator password of the Azure SQL Server | `string` | `null` | no |
| <a name="input_database_names"></a> [database\_names](#input\_database\_names) | (Required) List of Azure SQL database names | `list(string)` | `[]` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) Specifies whether to enable Managed System Identity for the Azure SQL Server | `map(any)` | `{}` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | (Optional) Specifies the existing Key Vault ID where you want to store AZ Sql Server Password and CMK Key. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location to deploy resources to. | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | (Optional) The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2. | `string` | `"1.2"` | no |
| <a name="input_mssql_version"></a> [mssql\_version](#input\_mssql\_version) | (Optional) Specifies the version of Azure SQL Server ti use. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server) | `string` | `"12.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Azure SQL Server | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) (Optional) Whether public network access is allowed for this server. Defaults to true. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of the resource group in which to create the MySQL Server | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource | `map(string)` | <pre>{<br>  "pe_enable": true<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fully_qualified_domain_name"></a> [fully\_qualified\_domain\_name](#output\_fully\_qualified\_domain\_name) | The fully qualified domain name of the Azure SQL Server |
| <a name="output_id"></a> [id](#output\_id) | The server id of Azure SQL Server |
| <a name="output_name"></a> [name](#output\_name) | The server name of Azure SQL Server |
| <a name="output_version"></a> [version](#output\_version) | The version of the Azure SQL Server. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
