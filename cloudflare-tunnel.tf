resource "cloudflare_tunnel_config" "cf_tunnel_config" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.cf_tunnel.id

  config {
    ingress_rule {
      hostname = module.overseerr.service_hostname
      service  = "http://localhost:${var.overseerr_port}"
    }
    ingress_rule {
      hostname = module.radarr.service_hostname
      service  = "http://localhost:${var.radarr_port}"
    }
    ingress_rule {
      hostname = module.sabnzbd.service_hostname
      service  = "http://localhost:${var.sabnzbd_port}"
    }
    ingress_rule {
      hostname = module.sonarr.service_hostname
      service  = "http://localhost:${var.sonarr_port}"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel" "cf_tunnel" {
  account_id = var.cloudflare_account_id
  name       = var.cf_tunnel_name
  secret     = var.cf_tunnel_secret
  config_src = "cloudflare"
}

variable "cf_tunnel_name" {
  description = "Name for the Cloudflare Tunnel. Modification forces creation of a new resource."
  type        = string
}

variable "cf_tunnel_secret" {
  description = "Secret for the Cloudflare tunnel. 32 or more bytes, encoded as a base64 string."
  type        = string
  sensitive   = true
}