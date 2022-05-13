# azurerm-frontdoor-waf

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
| [azurerm_frontdoor_firewall_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_address"></a> [backend\_address](#input\_backend\_address) | (Required) Location of the backend (IP address or FQDN) | `string` | n/a | yes |
| <a name="input_backend_host_header"></a> [backend\_host\_header](#input\_backend\_host\_header) | (Required) The value to use as the host header sent to the backend. | `string` | n/a | yes |
| <a name="input_backend_http_port"></a> [backend\_http\_port](#input\_backend\_http\_port) | (Optional) The HTTP TCP port number. Possible values are between 1 - 65535. | `number` | `80` | no |
| <a name="input_backend_https_port"></a> [backend\_https\_port](#input\_backend\_https\_port) | (Optional) The HTTPS TCP port number. Possible values are between 1 - 65535. | `number` | `443` | no |
| <a name="input_custom_https_configuration"></a> [custom\_https\_configuration](#input\_custom\_https\_configuration) | (Optional) Custom HTTPS configuration. | <pre>object({<br>    certificate_source      = string<br>    certificate_secret_name = string<br>    certificate_vault_id    = string<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of FrontDoor and associated resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the name of the Resource Group in which the Front Door service should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of key value pairs for the resource tagging. Default: none. | `map(any)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
