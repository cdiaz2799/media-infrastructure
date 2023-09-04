variable "service_name" {
  description = "Name of the service"
  type        = string
}

variable "service_image" {
  description = "Docker image for the service"
  type        = string
}

variable "host_port" {
  description = "Port on the host machine"
  type        = string
}

variable "container_port" {
  description = "Port inside the container"
  type        = string
}

variable "host_config_path" {
  description = "Host path for service configuration directory"
  type        = string
}

variable "container_config_path" {
  description = "Container path for service configuration directory"
  type        = string
}

variable "volumes" {
  description = "List of extra volume mounts as maps (host_path, container_path, read_only)"
  type        = list(object({
    host_path      = string
    container_path = string
    read_only      = bool
  }))
  default     = []
}

variable "timezone" {
  description = "Timezone"
  type        = string
  default     = "America/Phoenix"
}

variable "service_cf_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "service_cf_tunnel_cname" {
  description = "Cloudflare Tunnel CNAME"
  type        = string
}