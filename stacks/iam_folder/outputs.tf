output "editors" {
  description = "All outputs from IAM module editors"
  value       = module.editors
}

output "viewers" {
  description = "All outputs from IAM module viewers"
  value       = module.viewers
}

output "admins" {
  description = "All outputs from IAM module admins"
  value       = module.viewers
}
