# App

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.93.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app-rg"></a> [app-rg](#module\_app-rg) | ../../Modules/resourcegroup | n/a |
| <a name="module_key-vault"></a> [key-vault](#module\_key-vault) | ../../Modules/keyvault | n/a |
| <a name="module_network"></a> [network](#module\_network) | ../../Modules/networking | n/a |
| <a name="module_network-rg"></a> [network-rg](#module\_network-rg) | ../../Modules/resourcegroup | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ../../Modules/storage | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policy"></a> [access\_policy](#input\_access\_policy) | (Optional) A list of up to 16 objects describing access policies, as described below. | <pre>list(object({<br>    object_id               = string<br>    certificate_permissions = list(string)<br>    key_permissions         = list(string)<br>    secret_permissions      = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_app_rg_name"></a> [app\_rg\_name](#input\_app\_rg\_name) | The resource group name to create the app resources in | `string` | `"app-tf-rg"` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | (Optional) List of containers to create and their access levels. | <pre>list(object({<br>    name        = string<br>    access_type = string<br>  }))</pre> | `[]` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | (Required) The name of the key vault to create | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location to create the network in | `string` | `"eastus2"` | no |
| <a name="input_network_rg_name"></a> [network\_rg\_name](#input\_network\_rg\_name) | The resource group name to create the network in | `string` | `"network-tf-rg"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium. | `string` | n/a | yes |
| <a name="input_soft_delete_retention"></a> [soft\_delete\_retention](#input\_soft\_delete\_retention) | Number of retention days for soft delete. If set to null it will disable soft delete all together. | `number` | `0` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | (Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The virtal networks subnets with their properties. | <pre>map(object({<br>    name              = string<br>    vnet_key          = string<br>    vnet_name         = string<br>    address_prefixes  = list(string)<br>    pe_enable         = bool<br>    service_endpoints = list(string)<br>    delegation = list(object({<br>      name = string<br>      service_delegation = list(object({<br>        name    = string<br>        actions = list(string)<br>      }))<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_networks"></a> [virtual\_networks](#input\_virtual\_networks) | The virtal networks with their properties. | <pre>map(object({<br>    name          = string<br>    address_space = list(string)<br>    dns_servers   = list(string)<br>    ddos_protection_plan = object({<br>      id     = string<br>      enable = bool<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_vnet_peering"></a> [vnet\_peering](#input\_vnet\_peering) | Vnet Peering to the destination Vnet | <pre>map(object({<br>    destination_vnet_name        = string<br>    destination_vnet_rg          = string<br>    vnet_key                     = string<br>    allow_virtual_network_access = bool<br>    allow_forwarded_traffic      = bool<br>    allow_gateway_transit        = bool<br>    use_remote_gateways          = bool<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault"></a> [keyvault](#output\_keyvault) | n/a |
| <a name="output_networking"></a> [networking](#output\_networking) | n/a |
| <a name="output_storage"></a> [storage](#output\_storage) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
