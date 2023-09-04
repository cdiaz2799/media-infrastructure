output "container_name" {
  description = "Name of the container"
  value       = docker_container.service.name
}

output "service_hostname" {
  description = "Hostname for the service"
  value       = cloudflare_record.service.hostname
}

output "service_url" {
  description = "URL for the service"
  value       = "https://${cloudflare_record.service.hostname}"
}