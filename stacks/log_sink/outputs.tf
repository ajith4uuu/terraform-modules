# Sinks
output "sink_bq_activity_logs" {
  description = "All outputs from sink module"
  value       = module.sink_bq_activity_logs
}
output "sink_bq_system_event_logs" {
  description = "All outputs from sink module"
  value       = module.sink_bq_system_event_logs
}
output "sink_bq_data_access_logs" {
  description = "All outputs from sink module"
  value       = module.sink_bq_data_access_logs
}
output "sink_bq_access_transparency_logs" {
  description = "All outputs from sink module"
  value       = module.sink_bq_access_transparency_logs
}
output "sink_bq_policy_denied_logs" {
  description = "All outputs from sink module"
  value       = module.sink_bq_policy_denied_logs
}

# Destinations
output "destination_bq_activity_logs" {
  description = "All outputs from destination module"
  value       = module.destination_bq_activity_logs
}
output "destination_bq_system_event_logs" {
  description = "All outputs from destination module"
  value       = module.destination_bq_system_event_logs
}
output "destination_bq_data_access_logs" {
  description = "All outputs from destination module"
  value       = module.destination_bq_data_access_logs
}
output "destination_bq_access_transparency_logs" {
  description = "All outputs from destination module"
  value       = module.destination_bq_access_transparency_logs
}
output "destination_bq_policy_denied_logs" {
  description = "All outputs from destination module"
  value       = module.destination_bq_policy_denied_logs
}

## IAM for destination project
output "bigquery_project_permissions" {
  description = "Permissions of the users/groups added to the destination project"
  value       = google_project_iam_member.bigquery_project_permissions
}

# Labels
output "labels" {
  description = "All outputs from labels module"
  value       = module.labels
}
