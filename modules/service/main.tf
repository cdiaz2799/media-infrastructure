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

resource "docker_container" "service" {
  name     = var.service_name
  hostname = var.service_name
  image    = var.service_image
  restart  = "unless-stopped"
  start    = true

  ports {
    internal = var.container_port
    external = var.host_port
  }

  volumes {
    host_path      = var.host_config_path
    container_path = var.container_config_path
    read_only      = false
  }

  dynamic "volumes" {
    for_each = var.volumes
    content {
      host_path      = volumes.value.host_path
      container_path = volumes.value.container_path
      read_only      = volumes.value.read_only
    }
  }
  
  env = [
    "TZ=${var.timezone}"
  ]
}

resource "cloudflare_record" "service" {
  zone_id = var.service_cf_zone_id
  name    = var.service_name
  value   = var.service_cf_tunnel_cname
  type    = "CNAME"
  proxied = true
}

