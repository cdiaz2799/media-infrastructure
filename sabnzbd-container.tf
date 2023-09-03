variable "sabnzbd_port" {
  description = "Port for Sabnzbd"
  type        = string
  default     = "6790"
}

variable "sabnzbd_config_dir" {
  description = "Configuration Directory for Sabnzbd"
  type        = string
  default     = "/Users/Shared/sabnzbd/"
}

resource "docker_container" "sabnzbd" {
  name     = "sabnzbd"
  image    = docker_image.sabnzbd.image_id
  start    = true
  restart  = "unless-stopped"
  hostname = "sabnzbd"

  ports {
    internal = "8080"
    external = var.sabnzbd_port
  }

  volumes {
    container_path = "/config"
    host_path      = var.sabnzbd_config_dir
    read_only      = false
  }
  volumes {
    container_path = "/downloads"
    host_path      = "/Volumes/MEDIA/"
    read_only      = false
  }
  volumes {
    container_path = "/incomplete-downloads"
    host_path      = "/Volumes/MEDIA/incomplete"
    read_only      = false
  }

  env = [
    "PGID=1000",
    "PUID=1000",
    "TZ=America/Phoenix"
  ]
}

resource "docker_image" "sabnzbd" {
  name          = data.docker_registry_image.sabnzbd.name
  pull_triggers = [data.docker_registry_image.sabnzbd.sha256_digest]
}

data "docker_registry_image" "sabnzbd" {
  name = "lscr.io/linuxserver/sabnzbd:latest"
}

resource "cloudflare_record" "sabnzbd" {
  zone_id = var.cf_zone_id
  name    = "sabnzbd"
  value   = cloudflare_tunnel.cf_tunnel.cname
  type    = "CNAME"
  proxied = true
}

output "sabnzbd_url" {
  value = "https://${cloudflare_record.sabnzbd.hostname}"
}

