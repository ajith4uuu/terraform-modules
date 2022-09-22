locals {
  activity_name            = "${module.labels.underscore_resource_name}_activity_logs"
  system_event_name        = "${module.labels.underscore_resource_name}_system_event_logs"
  data_access_name         = "${module.labels.underscore_resource_name}_data_access_logs"
  access_transparency_name = "${module.labels.underscore_resource_name}_access_transparency_logs"
  policy_denied_name       = "${module.labels.underscore_resource_name}_policy_denied_logs"

  activity_description            = "Activity logs for ${module.labels.transformed_labels.environment} environment"
  system_event_description        = "System Event logs for ${module.labels.transformed_labels.environment} environment"
  data_access_description         = "Data Access logs for ${module.labels.transformed_labels.environment} environment"
  access_transparency_description = "Access Transparency logs for ${module.labels.transformed_labels.environment} environment"
  policy_denied_description       = "Policy Denied logs for ${module.labels.transformed_labels.environment} environment"
}

# Get standardised labels and resource name
module "labels" {
  source = "../..//modules/labels"

  prefix_id   = var.prefix_id
  email       = var.labels.email
  costid      = var.labels.costid
  live        = var.labels.live
  environment = var.labels.environment
  servicename = var.labels.servicename
}

# Sinks
module "sink_bq_activity_logs" {
  source                 = "github.com/terraform-google-modules/terraform-google-log-export?ref=v7.2.0"
  destination_uri        = module.destination_bq_activity_logs.destination_uri
  filter                 = "logName: \"/logs/cloudaudit.googleapis.com%2Factivity\""
  log_sink_name          = local.activity_name
  parent_resource_id     = var.sink_parent_resource_id
  parent_resource_type   = var.sink_parent_resource_type
  include_children       = true
  unique_writer_identity = var.unique_writer_identity
  bigquery_options = {
    use_partitioned_tables = true
  }
}

module "sink_bq_system_event_logs" {
  source                 = "github.com/terraform-google-modules/terraform-google-log-export?ref=v7.2.0"
  destination_uri        = module.destination_bq_system_event_logs.destination_uri
  filter                 = "logName: \"/logs/cloudaudit.googleapis.com%2Fsystem_event\""
  log_sink_name          = local.system_event_name
  parent_resource_id     = var.sink_parent_resource_id
  parent_resource_type   = var.sink_parent_resource_type
  include_children       = true
  unique_writer_identity = var.unique_writer_identity
  bigquery_options = {
    use_partitioned_tables = true
  }
}

module "sink_bq_data_access_logs" {
  source                 = "github.com/terraform-google-modules/terraform-google-log-export?ref=v7.2.0"
  destination_uri        = module.destination_bq_data_access_logs.destination_uri
  filter                 = "logName: \"/logs/cloudaudit.googleapis.com%2Fdata_access\""
  log_sink_name          = local.data_access_name
  parent_resource_id     = var.sink_parent_resource_id
  parent_resource_type   = var.sink_parent_resource_type
  include_children       = true
  unique_writer_identity = var.unique_writer_identity
  bigquery_options = {
    use_partitioned_tables = true
  }
}

module "sink_bq_access_transparency_logs" {
  source                 = "github.com/terraform-google-modules/terraform-google-log-export?ref=v7.2.0"
  destination_uri        = module.destination_bq_access_transparency_logs.destination_uri
  filter                 = "logName: \"/logs/cloudaudit.googleapis.com%2Faccess_transparency\""
  log_sink_name          = local.access_transparency_name
  parent_resource_id     = var.sink_parent_resource_id
  parent_resource_type   = var.sink_parent_resource_type
  include_children       = true
  unique_writer_identity = var.unique_writer_identity
  bigquery_options = {
    use_partitioned_tables = true
  }
}

module "sink_bq_policy_denied_logs" {
  source                 = "github.com/terraform-google-modules/terraform-google-log-export?ref=v7.2.0"
  destination_uri        = module.destination_bq_policy_denied_logs.destination_uri
  filter                 = "logName: \"/logs/cloudaudit.googleapis.com%2Fpolicy\""
  log_sink_name          = local.policy_denied_name
  parent_resource_id     = var.sink_parent_resource_id
  parent_resource_type   = var.sink_parent_resource_type
  include_children       = true
  unique_writer_identity = var.unique_writer_identity
  bigquery_options = {
    use_partitioned_tables = true
  }
}

# Destination for log sinks
module "destination_bq_activity_logs" {
  source                     = "github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery?ref=v7.2.0"
  project_id                 = var.project_id
  location                   = var.log_location
  dataset_name               = local.activity_name
  description                = local.activity_description
  delete_contents_on_destroy = var.delete_contents_on_destroy
  expiration_days            = var.expiration_days
  labels                     = module.labels.transformed_labels
  log_sink_writer_identity   = module.sink_bq_activity_logs.writer_identity
}

module "destination_bq_system_event_logs" {
  source                     = "github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery?ref=v7.2.0"
  project_id                 = var.project_id
  location                   = var.log_location
  dataset_name               = local.system_event_name
  description                = local.system_event_description
  delete_contents_on_destroy = var.delete_contents_on_destroy
  expiration_days            = var.expiration_days
  labels                     = module.labels.transformed_labels
  log_sink_writer_identity   = module.sink_bq_system_event_logs.writer_identity
}

module "destination_bq_data_access_logs" {
  source                     = "github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery?ref=v7.2.0"
  project_id                 = var.project_id
  location                   = var.log_location
  dataset_name               = local.data_access_name
  description                = local.data_access_description
  delete_contents_on_destroy = var.delete_contents_on_destroy
  expiration_days            = var.expiration_days
  labels                     = module.labels.transformed_labels
  log_sink_writer_identity   = module.sink_bq_data_access_logs.writer_identity
}

module "destination_bq_access_transparency_logs" {
  source                     = "github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery?ref=v7.2.0"
  project_id                 = var.project_id
  location                   = var.log_location
  dataset_name               = local.access_transparency_name
  description                = local.access_transparency_description
  delete_contents_on_destroy = var.delete_contents_on_destroy
  expiration_days            = var.expiration_days
  labels                     = module.labels.transformed_labels
  log_sink_writer_identity   = module.sink_bq_access_transparency_logs.writer_identity
}

module "destination_bq_policy_denied_logs" {
  source                     = "github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery?ref=v7.2.0"
  project_id                 = var.project_id
  location                   = var.log_location
  dataset_name               = local.policy_denied_name
  description                = local.policy_denied_description
  delete_contents_on_destroy = var.delete_contents_on_destroy
  expiration_days            = var.expiration_days
  labels                     = module.labels.transformed_labels
  log_sink_writer_identity   = module.sink_bq_policy_denied_logs.writer_identity
}

# User IAM permissions to destination project
resource "google_project_iam_member" "bigquery_project_permissions" {
  for_each = toset(var.bigquery_project_iam_permissions)
  project  = var.project_id
  role     = each.value
  member   = var.log_project_member
}
