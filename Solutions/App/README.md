# App

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app-rg"></a> [app-rg](#module\_app-rg) | ../../Modules/azurerm-resourcegroup | n/a |
| <a name="module_appservice-plan"></a> [appservice-plan](#module\_appservice-plan) | ../../Modules/azurerm-appservice-plan | n/a |
| <a name="module_azurecaf-app"></a> [azurecaf-app](#module\_azurecaf-app) | ../../Modules/azurecaf-naming | n/a |
| <a name="module_azurecaf-data"></a> [azurecaf-data](#module\_azurecaf-data) | ../../Modules/azurecaf-naming | n/a |
| <a name="module_azurecaf-network"></a> [azurecaf-network](#module\_azurecaf-network) | ../../Modules/azurecaf-naming | n/a |
| <a name="module_azurecaf-shared"></a> [azurecaf-shared](#module\_azurecaf-shared) | ../../Modules/azurecaf-naming | n/a |
| <a name="module_frontdoor"></a> [frontdoor](#module\_frontdoor) | ../../Modules/azurerm-frontdoor | n/a |
| <a name="module_frontdoor-nsg"></a> [frontdoor-nsg](#module\_frontdoor-nsg) | ../../Modules/azurerm-networksecuritygroup | n/a |
| <a name="module_key-vault"></a> [key-vault](#module\_key-vault) | ../../Modules/azurerm-keyvault | n/a |
| <a name="module_linux-webapp"></a> [linux-webapp](#module\_linux-webapp) | ../../Modules/azurerm-appservice-linux-webapp | n/a |
| <a name="module_mssql-private-endpoint"></a> [mssql-private-endpoint](#module\_mssql-private-endpoint) | ../../Modules/azurerm-private-endpoint | n/a |
| <a name="module_mssql-server"></a> [mssql-server](#module\_mssql-server) | ../../Modules/azurerm-mssql-server | n/a |
| <a name="module_mssql-server-database-both-term-policy"></a> [mssql-server-database-both-term-policy](#module\_mssql-server-database-both-term-policy) | ../../Modules/azurerm-mssql-database | n/a |
| <a name="module_mssql-server-database-long-term-policy"></a> [mssql-server-database-long-term-policy](#module\_mssql-server-database-long-term-policy) | ../../Modules/azurerm-mssql-database | n/a |
| <a name="module_mssql-server-database-short-term-policy"></a> [mssql-server-database-short-term-policy](#module\_mssql-server-database-short-term-policy) | ../../Modules/azurerm-mssql-database | n/a |
| <a name="module_private-dns"></a> [private-dns](#module\_private-dns) | ../../Modules/azurerm-private-dns | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ../../Modules/azurerm-storage | n/a |
| <a name="module_storage-account-private-endpoint"></a> [storage-account-private-endpoint](#module\_storage-account-private-endpoint) | ../../Modules/azurerm-private-endpoint | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policy"></a> [access\_policy](#input\_access\_policy) | (Optional) A list of up to 16 objects describing access policies, as described below. | <pre>list(object({<br>    object_id               = string<br>    certificate_permissions = list(string)<br>    key_permissions         = list(string)<br>    secret_permissions      = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | (Required) Product/Application name which will be appended as a suffix. | `string` | n/a | yes |
| <a name="input_azuread_administrator"></a> [azuread\_administrator](#input\_azuread\_administrator) | (Optional) Map of AAD attributes to manage the MSSQL server with | `map(any)` | `{}` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | (Optional) List of containers to create and their access levels. | <pre>list(object({<br>    name        = string<br>    access_type = string<br>  }))</pre> | `[]` | no |
| <a name="input_country_code"></a> [country\_code](#input\_country\_code) | (Required) Short country code to use for the name (eg. eu for europe, na for north america) | `string` | n/a | yes |
| <a name="input_environment_code"></a> [environment\_code](#input\_environment\_code) | (Required) Numerical representation of the environment | `string` | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | (Optional) The identity IDs to use for the Azure SQL Server. Valid values are: SystemAssigned, UserAssigned, None | `set(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) The type of identity to use for the resource. Possible values are SystemAssigned, UserAssigned, None. Defaults to None. | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) location - example: South Central US = southcentralus | `string` | n/a | yes |
| <a name="input_network_security_groups"></a> [network\_security\_groups](#input\_network\_security\_groups) | A map of objects of network security groups to apply to the resource. | `map(any)` | `{}` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | (Required) Email or ID of the owner for the resource. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Optional) Prefix to set for the resource names. Defaults to 'az'. | `string` | `"az"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium. | `string` | `"standard"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Resource ID for the existing subnet to use for this deployment | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Additional tags to apply to the resource. | `map(any)` | `{}` | no |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | Resource ID for the existing VNet to use for this deployment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app-rg"></a> [app-rg](#output\_app-rg) | Application Layer Outputs --------------------------------------------------------- |
| <a name="output_appservice-linux-webapp"></a> [appservice-linux-webapp](#output\_appservice-linux-webapp) | n/a |
| <a name="output_appservice-linux-webapp-identity"></a> [appservice-linux-webapp-identity](#output\_appservice-linux-webapp-identity) | n/a |
| <a name="output_appservice-plan"></a> [appservice-plan](#output\_appservice-plan) | n/a |
| <a name="output_azurecaf-name"></a> [azurecaf-name](#output\_azurecaf-name) | n/a |
| <a name="output_data-mssql-server"></a> [data-mssql-server](#output\_data-mssql-server) | Data Layer Outputs --------------------------------------------------------- |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
