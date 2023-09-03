## Container
resource "docker_container" "radarr" {
  name     = "radarr"
  hostname = "radarr"
  image    = docker_image.radarr.image_id
  restart  = "unless-stopped"
  start    = true

  env = [
    "TZ=America/Phoenix"
  ]

  ports {
    internal = "7878"
    external = var.radarr_port
  }

  volumes {
    host_path      = var.radarr_config_path
    container_path = "/config"
    read_only      = false
  }
  volumes {
    host_path      = var.movies_path
    container_path = "/movies"
    read_only      = false
  }
}

## Image

data "docker_registry_image" "radarr" {
  name = "lscr.io/linuxserver/radarr:latest"
}

resource "docker_image" "radarr" {
  name          = data.docker_registry_image.radarr.name
  pull_triggers = [data.docker_registry_image.radarr.sha256_digest]
}

## Vars
variable "radarr_port" {
  type    = string
  default = "7878"
}

variable "radarr_config_path" {
  type    = string
  default = "/Users/christian/Radarr"
}

variable "movies_path" {
  type    = string
  default = "/Volumes/MEDIA/Movies"
}

resource "cloudflare_record" "radarr" {
  zone_id = var.cf_zone_id
  name    = "radarr"
  value   = cloudflare_tunnel.cf_tunnel.cname
  type    = "CNAME"
  proxied = true
}

output "radarr_url" {
  value = "https://${cloudflare_record.radarr.hostname}"
}