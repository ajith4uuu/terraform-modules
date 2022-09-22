output "router_info" {
  description = "GCP Router details"
  value       = google_compute_router.router
}

output "nats_info" {
  description = "NATs details"
  value       = google_compute_router_nat.nats
}
