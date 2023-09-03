## Container
resource "docker_container" "sonarr" {
  name     = "sonarr"
  hostname = "sonarr"
  image    = docker_image.sonarr.image_id
  restart  = "unless-stopped"
  start    = true

  ports {
    internal = "8989"
    external = var.sonarr_port
  }

  volumes {
    host_path      = var.sonarr_config_path
    container_path = "/config"
    read_only      = false
  }
  volumes {
    host_path      = var.tv_path
    container_path = "/tv"
    read_only      = false
  }

  env = [
    "TZ=America/Phoenix"
  ]
}

## Image

data "docker_registry_image" "sonarr" {
  name = "lscr.io/linuxserver/sonarr:latest"
}

resource "docker_image" "sonarr" {
  name          = data.docker_registry_image.sonarr.name
  pull_triggers = [data.docker_registry_image.sonarr.sha256_digest]
}

## Vars
variable "sonarr_port" {
  type    = string
  default = "8989"
}

variable "sonarr_config_path" {
  type    = string
  default = "/Users/christian/Sonarr"
}

variable "tv_path" {
  type    = string
  default = "/Volumes/MEDIA/TV"
}

resource "cloudflare_record" "sonarr" {
  zone_id = var.cf_zone_id
  name    = "sonarr"
  value   = cloudflare_tunnel.cf_tunnel.cname
  type    = "CNAME"
  proxied = true
}

output "sonarr_url" {
  value = "https://${cloudflare_record.sonarr.hostname}"
}
