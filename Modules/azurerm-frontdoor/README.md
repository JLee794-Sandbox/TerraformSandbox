# keyvault

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
| [azurerm_frontdoor.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor) | resource |
| [azurerm_frontdoor_custom_https_configuration.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor_custom_https_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_address"></a> [backend\_address](#input\_backend\_address) | (Required) Location of the backend (IP address or FQDN) | `string` | n/a | yes |
| <a name="input_backend_host_header"></a> [backend\_host\_header](#input\_backend\_host\_header) | (Required) The value to use as the host header sent to the backend. | `string` | n/a | yes |
| <a name="input_backend_http_port"></a> [backend\_http\_port](#input\_backend\_http\_port) | (Optional) The HTTP TCP port number. Possible values are between 1 - 65535. | `number` | `80` | no |
| <a name="input_backend_https_port"></a> [backend\_https\_port](#input\_backend\_https\_port) | (Optional) The HTTPS TCP port number. Possible values are between 1 - 65535. | `number` | `443` | no |
| <a name="input_backend_pools_send_receive_timeout_seconds"></a> [backend\_pools\_send\_receive\_timeout\_seconds](#input\_backend\_pools\_send\_receive\_timeout\_seconds) | (Optional) Specifies the send and receive timeout on forwarding request to the backend. When the timeout is reached, the request fails and returns. Possible values are between 0 - 240. Defaults to 60. | `number` | `60` | no |
| <a name="input_custom_https_configuration"></a> [custom\_https\_configuration](#input\_custom\_https\_configuration) | (Optional) Custom HTTPS configuration. | <pre>object({<br>    certificate_source      = string<br>    certificate_secret_name = string<br>    certificate_vault_id    = string<br>  })</pre> | `null` | no |
| <a name="input_enforce_backend_pools_certificate_name_check"></a> [enforce\_backend\_pools\_certificate\_name\_check](#input\_enforce\_backend\_pools\_certificate\_name\_check) | (Optional) Enforce certificate name check on HTTPS requests to all backend pools, this setting will have no effect on HTTP requests. Permitted values are true or false. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of FrontDoor and associated resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the name of the Resource Group in which the Front Door service should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of key value pairs for the resource tagging. Default: none. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_https_configuration_object"></a> [custom\_https\_configuration\_object](#output\_custom\_https\_configuration\_object) | n/a |
| <a name="output_frontdoor_object"></a> [frontdoor\_object](#output\_frontdoor\_object) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
