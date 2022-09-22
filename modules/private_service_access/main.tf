resource "google_project_service" "enable_service" {
  project = var.project_id
  service = "servicenetworking.googleapis.com"
}

resource "google_compute_global_address" "main_ip_alloc" {
  project       = var.project_id
  name          = var.global_address_name
  address       = var.address
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.prefix_length
  network       = var.network_name
}

resource "google_service_networking_connection" "main_connector" {
  network                 = var.network_name
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.main_ip_alloc.name]
  depends_on = [
    google_project_service.enable_service
  ]
}
