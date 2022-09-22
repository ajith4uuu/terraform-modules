output "main_ip_alloc" {
  description = "Global Address resource"
  value       = google_compute_global_address.main_ip_alloc
}

output "main_connector" {
  description = "Service Networking Connection"
  value       = google_service_networking_connection.main_connector
}
