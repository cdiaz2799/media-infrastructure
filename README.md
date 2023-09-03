## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.2 |
| <a name="requirement_sonarr"></a> [sonarr](#requirement\_sonarr) | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | 3.0.2 |
| <a name="provider_sonarr"></a> [sonarr](#provider\_sonarr) | 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.overseerr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/container) | resource |
| [docker_container.radarr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/container) | resource |
| [docker_container.sabnzbd](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/container) | resource |
| [docker_container.sonarr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/container) | resource |
| [docker_image.overseerr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/image) | resource |
| [docker_image.radarr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/image) | resource |
| [docker_image.sabnzbd](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/image) | resource |
| [docker_image.sonarr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/image) | resource |
| [sonarr_download_client_sabnzbd.sabnzbd](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/download_client_sabnzbd) | resource |
| [sonarr_indexer_newznab.nzbgeek](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/indexer_newznab) | resource |
| [sonarr_media_management.sonarr](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/media_management) | resource |
| [sonarr_naming.naming](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/naming) | resource |
| [sonarr_notification_discord.discord](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/notification_discord) | resource |
| [sonarr_notification_plex.plex](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/notification_plex) | resource |
| [sonarr_notification_telegram.telegram](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/notification_telegram) | resource |
| [sonarr_root_folder.root](https://registry.terraform.io/providers/devopsarr/sonarr/3.0.0/docs/resources/root_folder) | resource |
| [docker_registry_image.overseerr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/data-sources/registry_image) | data source |
| [docker_registry_image.radarr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/data-sources/registry_image) | data source |
| [docker_registry_image.sabnzbd](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/data-sources/registry_image) | data source |
| [docker_registry_image.sonarr](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/data-sources/registry_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_discord_sonarr_webhook"></a> [discord\_sonarr\_webhook](#input\_discord\_sonarr\_webhook) | Weebhook URL for Discord / Sonarr Integration | `string` | n/a | yes |
| <a name="input_host_ip"></a> [host\_ip](#input\_host\_ip) | IP of the host running the stack | `string` | n/a | yes |
| <a name="input_movies_path"></a> [movies\_path](#input\_movies\_path) | n/a | `string` | `"/Volumes/MEDIA/Movies"` | no |
| <a name="input_nzbgeek_api_key"></a> [nzbgeek\_api\_key](#input\_nzbgeek\_api\_key) | NZBgeek API Key | `string` | n/a | yes |
| <a name="input_overseerr_path"></a> [overseerr\_path](#input\_overseerr\_path) | Host path for Overseerr directory | `string` | `"/Users/Shared/Overseerr"` | no |
| <a name="input_overseerr_port"></a> [overseerr\_port](#input\_overseerr\_port) | Port for Overseerr | `string` | `"5055"` | no |
| <a name="input_plex_token"></a> [plex\_token](#input\_plex\_token) | Plex Auth Token | `string` | n/a | yes |
| <a name="input_radarr_config_path"></a> [radarr\_config\_path](#input\_radarr\_config\_path) | n/a | `string` | `"/Users/christian/Radarr"` | no |
| <a name="input_radarr_port"></a> [radarr\_port](#input\_radarr\_port) | # Vars | `string` | `"7878"` | no |
| <a name="input_sabnzbd_api_key"></a> [sabnzbd\_api\_key](#input\_sabnzbd\_api\_key) | API Key from Sabnzbd | `string` | n/a | yes |
| <a name="input_sabnzbd_config_dir"></a> [sabnzbd\_config\_dir](#input\_sabnzbd\_config\_dir) | Configuration Directory for Sabnzbd | `string` | `"/Users/Shared/sabnzbd/"` | no |
| <a name="input_sabnzbd_port"></a> [sabnzbd\_port](#input\_sabnzbd\_port) | Port for Sabnzbd | `string` | `"6790"` | no |
| <a name="input_sabnzbd_pw"></a> [sabnzbd\_pw](#input\_sabnzbd\_pw) | n/a | `string` | n/a | yes |
| <a name="input_sabnzbd_username"></a> [sabnzbd\_username](#input\_sabnzbd\_username) | n/a | `string` | n/a | yes |
| <a name="input_sonarr_api_key"></a> [sonarr\_api\_key](#input\_sonarr\_api\_key) | API Key for Radarr | `string` | n/a | yes |
| <a name="input_sonarr_config_path"></a> [sonarr\_config\_path](#input\_sonarr\_config\_path) | n/a | `string` | `"/Users/christian/Sonarr"` | no |
| <a name="input_sonarr_port"></a> [sonarr\_port](#input\_sonarr\_port) | # Vars | `string` | `"8989"` | no |
| <a name="input_telegram_sonarr_chatid"></a> [telegram\_sonarr\_chatid](#input\_telegram\_sonarr\_chatid) | Chat ID for Sonarr Telegram Bot | `string` | n/a | yes |
| <a name="input_telegram_sonarr_token"></a> [telegram\_sonarr\_token](#input\_telegram\_sonarr\_token) | Bot token for Sonarr Telegram Bot | `string` | n/a | yes |
| <a name="input_tv_path"></a> [tv\_path](#input\_tv\_path) | n/a | `string` | `"/Volumes/MEDIA/TV"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sonarr_url"></a> [sonarr\_url](#output\_sonarr\_url) | n/a |