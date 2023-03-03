# keyvault_access_policies

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azuread_apps"></a> [azuread\_apps](#module\_azuread\_apps) | ./access_policy | n/a |
| <a name="module_azuread_group"></a> [azuread\_group](#module\_azuread\_group) | ./access_policy | n/a |
| <a name="module_azuread_service_principals"></a> [azuread\_service\_principals](#module\_azuread\_service\_principals) | ./access_policy | n/a |
| <a name="module_diagnostic_storage_accounts"></a> [diagnostic\_storage\_accounts](#module\_diagnostic\_storage\_accounts) | ./access_policy | n/a |
| <a name="module_logged_in_aad_app"></a> [logged\_in\_aad\_app](#module\_logged\_in\_aad\_app) | ./access_policy | n/a |
| <a name="module_logged_in_user"></a> [logged\_in\_user](#module\_logged\_in\_user) | ./access_policy | n/a |
| <a name="module_managed_identity"></a> [managed\_identity](#module\_managed\_identity) | ./access_policy | n/a |
| <a name="module_mssql_managed_instance"></a> [mssql\_managed\_instance](#module\_mssql\_managed\_instance) | ./access_policy | n/a |
| <a name="module_mssql_managed_instances_secondary"></a> [mssql\_managed\_instances\_secondary](#module\_mssql\_managed\_instances\_secondary) | ./access_policy | n/a |
| <a name="module_storage_accounts"></a> [storage\_accounts](#module\_storage\_accounts) | ./access_policy | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `any` | n/a | yes |
| <a name="input_azuread_apps"></a> [azuread\_apps](#input\_azuread\_apps) | n/a | `map` | `{}` | no |
| <a name="input_azuread_groups"></a> [azuread\_groups](#input\_azuread\_groups) | n/a | `map` | `{}` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | Client configuration object (see module README.md). | `any` | n/a | yes |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | n/a | `any` | `null` | no |
| <a name="input_keyvault_key"></a> [keyvault\_key](#input\_keyvault\_key) | n/a | `any` | `null` | no |
| <a name="input_keyvaults"></a> [keyvaults](#input\_keyvaults) | n/a | `map` | `{}` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | n/a | `map` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
