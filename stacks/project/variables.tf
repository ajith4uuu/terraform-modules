variable "project_id_override" {
  description = "If you don't want to use the automatically generated project ID, specify an ID here, note: Project IDs must be globally unique"
  type        = string
  default     = ""
}

variable "billing_account" {
  description = "The ID of the billing account this project belongs to"
  type        = string
}

variable "org_id" {
  description = <<EOF
  The organization ID this project belongs to.
  Only one of organisation_id or folder_id may be specified.
  If the organisation_id is specified then the project is created at the top level of the org.
EOF
  type        = string
  default     = ""
}

variable "folder_id" {
  description = <<EOF
  The ID of the folder this project should be created under.
  Only one of organisation_id or folder_id may be specified.
  If the folder_id is specified, then the project is created under the specified folder.
EOF
  type        = string
  default     = ""
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

variable "lien" {
  description = "Add a lien on the project to prevent accidental deletion"
  type        = bool
  default     = false
}

variable "enable_shared_vpc_host_project" {
  description = "If this project is a shared VPC host project."
  type        = bool
  default     = false
}

variable "svpc_host_project_id" {
  description = "The ID of the host project which hosts the shared VPC. If NOT empty string, then this project will become a Service project."
  type        = string
  default     = ""
}

variable "shared_vpc_subnets" {
  description = "List of subnets fully qualified subnet IDs (ie. projects/$project_id/regions/$region/subnetworks/$subnet_id)"
  type        = list(string)
  default     = []
}

variable "vpc_service_control_attach_enabled" {
  description = "Whether the project will be attached to a VPC Service Control Perimeter"
  type        = bool
  default     = false
}

variable "vpc_service_control_perimeter_name" {
  description = "The name of a VPC Service Control Perimeter to add the created project to"
  type        = string
  default     = null
}

variable "default_service_account" {
  description = "Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`."
  default     = "deprivilege"
  type        = string
}


# Services
variable "services" {
  description = "The list of APIs to activate within the project: https://cloud.google.com/service-usage/docs/enabled-service"
  type        = list(string)
  default = [
    "iam.googleapis.com",
    "iap.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "container.googleapis.com",
    "containerscanning.googleapis.com",
    "appengine.googleapis.com",
    "run.googleapis.com",
    "storage-api.googleapis.com",
    "bigquery.googleapis.com",
    "pubsub.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudkms.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com"
  ]
}

variable "disable_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy"
  default     = true
  type        = bool
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services"
  default     = true
  type        = bool
}
