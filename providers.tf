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