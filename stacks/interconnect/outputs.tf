output "region1_router1_details" {
  description = "Region1-Router1 details"
  value       = module.region1_router1
}

output "region1_router2_details" {
  description = "Region1-Router2 details"
  value       = module.region1_router2
}

output "region2_router1_details" {
  description = "Region2-Router1 details"
  value       = module.region2_router1
}

output "region2_router2_details" {
  description = "Region2-Router2 details"
  value       = module.region2_router2
}

output "interconnect_details" {
  description = "interconnect details"
  value       = module.interconnect
}

output "labels" {
  description = "All outputs from labels module"
  value       = module.labels
}
