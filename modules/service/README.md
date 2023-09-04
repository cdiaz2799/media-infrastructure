<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.13.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.2 |
| <a name="requirement_sonarr"></a> [sonarr](#requirement\_sonarr) | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.13.0 |
| <a name="provider_docker"></a> [docker](#provider\_docker) | 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.service](https://registry.terraform.io/providers/cloudflare/cloudflare/4.13.0/docs/resources/record) | resource |
| [docker_container.service](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_config_path"></a> [container\_config\_path](#input\_container\_config\_path) | Container path for service configuration directory | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port inside the container | `string` | n/a | yes |
| <a name="input_host_config_path"></a> [host\_config\_path](#input\_host\_config\_path) | Host path for service configuration directory | `string` | n/a | yes |
| <a name="input_host_port"></a> [host\_port](#input\_host\_port) | Port on the host machine | `string` | n/a | yes |
| <a name="input_service_cf_tunnel_cname"></a> [service\_cf\_tunnel\_cname](#input\_service\_cf\_tunnel\_cname) | Cloudflare Tunnel CNAME | `string` | n/a | yes |
| <a name="input_service_cf_zone_id"></a> [service\_cf\_zone\_id](#input\_service\_cf\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |
| <a name="input_service_image"></a> [service\_image](#input\_service\_image) | Docker image for the service | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service | `string` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Timezone | `string` | `"America/Phoenix"` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | List of extra volume mounts as maps (host\_path, container\_path, read\_only) | <pre>list(object({<br>    host_path      = string<br>    container_path = string<br>    read_only      = bool<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_name"></a> [container\_name](#output\_container\_name) | Name of the container |
| <a name="output_service_hostname"></a> [service\_hostname](#output\_service\_hostname) | Hostname for the service |
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | URL for the service |
<!-- END_TF_DOCS -->