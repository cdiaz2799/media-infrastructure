variable "overseerr_port" {
  description = "Port for Overseerr"
  type        = string
  default     = "5055"
}

variable "overseerr_path" {
  description = "Host path for Overseerr directory"
  type        = string
  default     = "/Users/Shared/Overseerr"
}

data "docker_registry_image" "overseerr" {
  name = "sctx/overseerr:latest"
}

resource "docker_container" "overseerr" {
  name     = "overseerr"
  image    = docker_image.overseerr.image_id
  restart  = "unless-stopped"
  start    = true
  hostname = "overseerr"

  env = [
    "TZ=America/Phoenix"
  ]

  volumes {
    host_path      = var.overseerr_path
    container_path = "/app/config"
    read_only      = false
  }

  ports {
    internal = "5055"
    external = var.overseerr_port
  }
}

resource "docker_image" "overseerr" {
  name          = data.docker_registry_image.overseerr.name
  pull_triggers = [data.docker_registry_image.overseerr.sha256_digest]
}

resource "cloudflare_record" "overseerr" {
  zone_id = var.cf_zone_id
  name    = "overseerr"
  value   = cloudflare_tunnel.cf_tunnel.cname
  type    = "CNAME"
  proxied = true
}

output "overseerr_url" {
  value = "https://${cloudflare_record.overseerr.hostname}"
}