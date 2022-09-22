resource "google_compute_interconnect_attachment" "interconnect_attachment1_region1" {
  name    = "${var.ia_name_prefix}-ia11"
  project = var.project_id
  region  = var.region1
  router  = var.region1_router1_name

  admin_enabled            = var.activate
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
}

resource "google_compute_interconnect_attachment" "interconnect_attachment2_region1" {
  name    = "${var.ia_name_prefix}-ia21"
  project = var.project_id
  region  = var.region1
  router  = var.region1_router2_name

  admin_enabled            = var.activate
  edge_availability_domain = "AVAILABILITY_DOMAIN_2"
  type                     = "PARTNER"
}

resource "google_compute_interconnect_attachment" "interconnect_attachment1_region2" {
  name    = "${var.ia_name_prefix}-ia12"
  project = var.project_id
  region  = var.region2
  router  = var.region2_router1_name

  admin_enabled            = var.activate
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
}

resource "google_compute_interconnect_attachment" "interconnect_attachment2_region2" {
  name    = "${var.ia_name_prefix}-ia22"
  project = var.project_id
  region  = var.region2
  router  = var.region2_router2_name

  admin_enabled            = var.activate
  edge_availability_domain = "AVAILABILITY_DOMAIN_2"
  type                     = "PARTNER"
}
