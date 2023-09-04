terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    sonarr = {
      source  = "devopsarr/sonarr"
      version = "3.0.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.13.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "sonarr" {
  url     = "http://${var.host_ip}:${var.sonarr_port}"
  api_key = var.sonarr_api_key
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

module "overseerr" {
  source = "./modules/service"

  service_name            = "overseerr"
  service_image           = "sctx/overseerr:latest"
  host_port               = var.overseerr_port
  container_port          = "5055"
  host_config_path        = var.overseerr_host_config_path
  container_config_path   = "/app/config"
  service_cf_zone_id      = var.cf_zone_id
  service_cf_tunnel_cname = cloudflare_tunnel.cf_tunnel.cname
}

module "radarr" {
  source = "./modules/service"

  service_name            = "radarr"
  service_image           = "lscr.io/linuxserver/radarr:latest"
  host_port               = var.radarr_port
  container_port          = "7878"
  host_config_path        = var.radarr_host_config_path
  container_config_path   = "/config"
  service_cf_zone_id      = var.cf_zone_id
  service_cf_tunnel_cname = cloudflare_tunnel.cf_tunnel.cname
  volumes = [{
    host_path      = var.movies_path
    container_path = "/movies"
    read_only      = false
  }]

}

module "sonarr" {
  source = "./modules/service"

  service_name            = "sonarr"
  service_image           = "lscr.io/linuxserver/sonarr:latest"
  host_port               = var.sonarr_port
  container_port          = "8989"
  host_config_path        = var.sonarr_host_config_path
  container_config_path   = "/config"
  service_cf_zone_id      = var.cf_zone_id
  service_cf_tunnel_cname = cloudflare_tunnel.cf_tunnel.cname
  volumes = [{
    host_path      = var.tv_path
    container_path = "/tv"
    read_only      = false
  }]
}

module "sabnzbd" {
  source = "./modules/service"

  service_name            = "sabnzbd"
  service_image           = "lscr.io/linuxserver/sabnzbd:latest"
  host_port               = var.sabnzbd_port
  container_port          = "6790"
  host_config_path        = var.sabnzbd_host_config_path
  container_config_path   = "/config"
  service_cf_zone_id      = var.cf_zone_id
  service_cf_tunnel_cname = cloudflare_tunnel.cf_tunnel.cname
  volumes = [{
    container_path = "/downloads"
    host_path      = "/Volumes/MEDIA/"
    read_only      = false
    },
    {
      container_path = "/incomplete-downloads"
      host_path      = "/Volumes/MEDIA/incomplete"
      read_only      = false
  }]
}