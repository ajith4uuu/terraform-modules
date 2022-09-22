output "interconnect_attachment1_region1" {
  description = "Interconnect details for attachment1 from region1."
  value       = google_compute_interconnect_attachment.interconnect_attachment1_region1
}

output "interconnect_attachment2_region1" {
  description = "Interconnect details for attachment2 from region1."
  value       = google_compute_interconnect_attachment.interconnect_attachment2_region1
}

output "interconnect_attachment1_region2" {
  description = "Interconnect details for attachment1 from region2."
  value       = google_compute_interconnect_attachment.interconnect_attachment1_region2
}

output "interconnect_attachment2_region2" {
  description = "Interconnect details for attachment2 from region2."
  value       = google_compute_interconnect_attachment.interconnect_attachment2_region2
}
