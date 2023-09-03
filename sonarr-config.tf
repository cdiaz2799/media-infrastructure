## Media Management
resource "sonarr_media_management" "sonarr" {
  chmod_folder    = "755"
  chown_group     = ""
  set_permissions = false

  create_empty_folders = true
  delete_empty_folders = true

  download_propers_repacks    = "doNotPrefer"
  unmonitor_previous_episodes = true

  enable_media_info      = true
  episode_title_required = "bulkSeasonReleases"
  extra_file_extensions  = "srt,sub,nfo"
  file_date              = "none"
  hardlinks_copy         = true
  import_extra_files     = true
  minimum_free_space     = 100
  recycle_bin_days       = 7
  recycle_bin_path       = ""
  rescan_after_refresh   = "always"
  skip_free_space_check  = true

  depends_on = [docker_container.sonarr]
}

resource "sonarr_naming" "naming" {
  rename_episodes            = true
  replace_illegal_characters = true
  multi_episode_style        = 0
  colon_replacement_format   = 0

  daily_episode_format    = "{Series Title} - {Air-Date} - {Episode Title} {Quality Full}"
  anime_episode_format    = "{Series Title} - S{season:00}E{episode:00} - {Episode Title} {Quality Full}"
  series_folder_format    = "{Series TitleYear} {imdb-{ImdbId}}"
  season_folder_format    = "Season {season:00}"
  specials_folder_format  = "Specials"
  standard_episode_format = "{Series Title} - S{season:00}E{episode:00} - {Episode Title} {Quality Full}"

  depends_on = [docker_container.sonarr]
}

resource "sonarr_root_folder" "root" {
  path       = "/tv"
  depends_on = [docker_container.sonarr]

}

## Configure Notifications
resource "sonarr_notification_discord" "discord" {
  name = "Discord"

  on_download   = true
  import_fields = [0, 3, 6, 9, 10, 11]

  include_health_warnings = true

  web_hook_url = var.discord_sonarr_webhook
  avatar       = "https://res.cloudinary.com/razordarkamg/image/upload/v1621212884/SonarrV3_pufacd.png"
  username     = "Sonarr"
}

resource "sonarr_notification_telegram" "telegram" {
  name = "Sonarr Bot"

  on_download             = true
  include_health_warnings = true
  on_health_issue         = true
  on_upgrade              = true

  bot_token = var.telegram_sonarr_token
  chat_id   = var.telegram_sonarr_chatid

  send_silently = true
}

resource "sonarr_notification_plex" "plex" {
  name = "Plex"

  on_download                        = true
  on_upgrade                         = true
  on_rename                          = true
  on_series_delete                   = true
  on_episode_file_delete             = true
  on_episode_file_delete_for_upgrade = true

  update_library = true

  host    = var.host_ip
  port    = "32400"
  use_ssl = false

  auth_token = var.plex_token

}
## Configure Download Client
resource "sonarr_download_client_sabnzbd" "sabnzbd" {
  enable                     = true
  priority                   = 1
  name                       = "SABnzbd"
  host                       = var.host_ip
  port                       = var.sabnzbd_port
  use_ssl                    = false
  api_key                    = var.sabnzbd_api_key
  username                   = var.sabnzbd_username
  password                   = var.sabnzbd_pw
  tv_category                = "tv"
  recent_tv_priority         = -100
  older_tv_priority          = -100
  remove_completed_downloads = true
  remove_failed_downloads    = true

  depends_on = [docker_container.sabnzbd]
}

## Configure Indexer
resource "sonarr_indexer_newznab" "nzbgeek" {
  name = "NZBgeek"

  enable_rss                = true
  enable_automatic_search   = true
  enable_interactive_search = true

  base_url = "https://api.nzbgeek.info"
  api_path = "/api"
  api_key  = var.nzbgeek_api_key

  categories = [5000]

  priority = 25

  download_client_id = sonarr_download_client_sabnzbd.sabnzbd.id

  depends_on = [docker_container.sonarr]

}