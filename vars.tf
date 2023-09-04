variable "sonarr_api_key" {
  description = "API Key for Radarr"
  type        = string
  sensitive   = true
}

variable "sabnzbd_api_key" {
  description = "API Key from Sabnzbd"
  type        = string
  sensitive   = true
}

variable "sabnzbd_username" {
  type      = string
  sensitive = true
}

variable "sabnzbd_pw" {
  type      = string
  sensitive = true
}

variable "host_ip" {
  description = "IP of the host running the stack"
  type        = string
  sensitive   = true
}

variable "nzbgeek_api_key" {
  description = "NZBgeek API Key"
  type        = string
  sensitive   = true
}

variable "discord_sonarr_webhook" {
  description = "Weebhook URL for Discord / Sonarr Integration"
  type        = string
  sensitive   = true
}

variable "telegram_sonarr_token" {
  description = "Bot token for Sonarr Telegram Bot"
  type        = string
  sensitive   = true
}

variable "telegram_sonarr_chatid" {
  description = "Chat ID for Sonarr Telegram Bot"
  type        = string
  sensitive   = true
}

variable "plex_token" {
  description = "Plex Auth Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
  type        = string
  sensitive   = true
}

variable "cf_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
  sensitive   = true
}

variable "overseerr_port" {
  description = "Port exposed for Overseerr"
  type        = string
  default     = "5055"
}

variable "overseerr_host_config_path" {
  description = "Host path for Overseerr directory"
  type        = string
  default     = "/Users/Shared/Overseerr"
}

variable "radarr_port" {
  type        = string
  default     = "7878"
  description = "Port exposed for Radarr"
}

variable "radarr_host_config_path" {
  type    = string
  default = "/Users/christian/Radarr"
}
variable "movies_path" {
  type    = string
  default = "/Volumes/MEDIA/Movies"
}

variable "sonarr_port" {
  type    = string
  default = "8989"
}

variable "sonarr_host_config_path" {
  type    = string
  default = "/Users/christian/Sonarr"
}

variable "tv_path" {
  type    = string
  default = "/Volumes/MEDIA/TV"
}

variable "sabnzbd_port" {
  description = "Port for Sabnzbd"
  type        = string
  default     = "6790"
}

variable "sabnzbd_host_config_path" {
  description = "Configuration Directory for Sabnzbd"
  type        = string
  default     = "/Users/Shared/sabnzbd/"
}