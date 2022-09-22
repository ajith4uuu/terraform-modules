output "shared_vpc_subnets" {
  description = "List of target subnets to give permissions on"
  value       = var.shared_vpc_subnets
}

output "shared_vpc_network_users" {
  description = "All outputs from IAM module Shared VPC network users"
  value       = module.shared_vpc_network_users
}

output "shared_vpc_network_admin" {
  description = "All outputs from IAM module Shared VPC network admins"
  value       = module.shared_vpc_network_users
}
