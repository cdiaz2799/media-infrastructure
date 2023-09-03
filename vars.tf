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