variable "project_id" {
  description = "Project ID for log destination"
  type        = string
}

variable "log_location" {
  description = "The location of the logs. After setting the location it cannot be changed."
  type        = string
  default     = "EU"
}

variable "expiration_days" {
  description = "Log expiration days. Default is 90 days."
  type        = number
  default     = 90
}

# Sinks
variable "sink_parent_resource_type" {
  description = "The GCP resource in which you create the log sink. The value must not be computed, and must be one of the following: 'project', 'folder', 'billing_account', or 'organization'."
  type        = string
  default     = "folder"
}

variable "sink_parent_resource_id" {
  description = "The ID of the GCP resource in which you create the log sink, eg. if var.sink_parent_resource_type is set to 'folder', then this is the Folder ID."
  type        = string
}

variable "unique_writer_identity" {
  description = "Whether or not to create a unique identity associated with this sink. If false (the default), then the writer_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink."
  type        = bool
  default     = true
}

variable "delete_contents_on_destroy" {
  description = "If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present."
  type        = bool
  default     = false
}

## IAM for destination project
variable "bigquery_project_iam_permissions" {
  description = "List of IAM permissions that neeed to be granted for users to be able to see the logs."
  type        = list(string)
  default = [
    "roles/bigquery.dataViewer",
  ]
}

variable "log_project_member" {
  description = "User/Group to be given permissions to the central logs project. eg. Security team"
  type        = string
}

variable "prefix_id" {
  description = "4 chars prefix to uniquely identify Colt"
  type        = string
}

variable "labels" {
  description = <<EOF
  Map of labels (i.e. tags) to add to project for billing purposes
  Required labels example:
  labels = {
    email       = "platform.support@colt.net"
    costid      = "34623"
    live        = "no"
    environment = "dev"
    servicename = "myservice"
  }
EOF
  type        = map(string)
}
