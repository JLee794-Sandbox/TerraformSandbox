# subnet

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_container_registries"></a> [azure\_container\_registries](#module\_azure\_container\_registries) | ../private_endpoint | n/a |
| <a name="module_azure_container_registries_remote"></a> [azure\_container\_registries\_remote](#module\_azure\_container\_registries\_remote) | ../private_endpoint | n/a |
| <a name="module_data_factory"></a> [data\_factory](#module\_data\_factory) | ../private_endpoint | n/a |
| <a name="module_data_factory_remote"></a> [data\_factory\_remote](#module\_data\_factory\_remote) | ../private_endpoint | n/a |
| <a name="module_diagnostic_event_hub_namespaces"></a> [diagnostic\_event\_hub\_namespaces](#module\_diagnostic\_event\_hub\_namespaces) | ../private_endpoint | n/a |
| <a name="module_diagnostic_storage_account"></a> [diagnostic\_storage\_account](#module\_diagnostic\_storage\_account) | ../private_endpoint | n/a |
| <a name="module_event_hub_namespaces"></a> [event\_hub\_namespaces](#module\_event\_hub\_namespaces) | ../private_endpoint | n/a |
| <a name="module_event_hub_namespaces_remote"></a> [event\_hub\_namespaces\_remote](#module\_event\_hub\_namespaces\_remote) | ../private_endpoint | n/a |
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ../private_endpoint | n/a |
| <a name="module_keyvault_remote"></a> [keyvault\_remote](#module\_keyvault\_remote) | ../private_endpoint | n/a |
| <a name="module_mssql_servers"></a> [mssql\_servers](#module\_mssql\_servers) | ../private_endpoint | n/a |
| <a name="module_mssql_servers_remote"></a> [mssql\_servers\_remote](#module\_mssql\_servers\_remote) | ../private_endpoint | n/a |
| <a name="module_mysql_servers"></a> [mysql\_servers](#module\_mysql\_servers) | ../private_endpoint | n/a |
| <a name="module_mysql_servers_remote"></a> [mysql\_servers\_remote](#module\_mysql\_servers\_remote) | ../private_endpoint | n/a |
| <a name="module_recovery_vault"></a> [recovery\_vault](#module\_recovery\_vault) | ../private_endpoint | n/a |
| <a name="module_recovery_vault_remote"></a> [recovery\_vault\_remote](#module\_recovery\_vault\_remote) | ../private_endpoint | n/a |
| <a name="module_redis_caches"></a> [redis\_caches](#module\_redis\_caches) | ../private_endpoint | n/a |
| <a name="module_redis_caches_remote"></a> [redis\_caches\_remote](#module\_redis\_caches\_remote) | ../private_endpoint | n/a |
| <a name="module_signalr_service"></a> [signalr\_service](#module\_signalr\_service) | ../private_endpoint | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../private_endpoint | n/a |
| <a name="module_storage_account_remote"></a> [storage\_account\_remote](#module\_storage\_account\_remote) | ../private_endpoint | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client configuration object (see module README.md). | `any` | n/a | yes |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_private_dns"></a> [private\_dns](#input\_private\_dns) | n/a | `any` | n/a | yes |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | n/a | `any` | n/a | yes |
| <a name="input_remote_objects"></a> [remote\_objects](#input\_remote\_objects) | n/a | `any` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | n/a | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_vnet_location"></a> [vnet\_location](#input\_vnet\_location) | n/a | `any` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_signalr_service"></a> [signalr\_service](#output\_signalr\_service) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
