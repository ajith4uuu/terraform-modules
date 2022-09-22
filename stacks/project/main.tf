locals {
  # Determine whether this project is being created at the root org level or within a folder
  organisation_id = var.org_id != "" ? var.org_id : null
  folder_id       = var.folder_id != "" ? var.folder_id : null

  # Use override project ID if it's set, otherwise use resource name from labels module
  project_id = var.project_id_override != "" ? var.project_id_override : module.labels.random_resource_name
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

module "project" {
  source                             = "github.com/terraform-google-modules/terraform-google-project-factory?ref=v11.2.1"
  name                               = local.project_id
  project_id                         = local.project_id
  org_id                             = local.organisation_id
  folder_id                          = local.folder_id
  billing_account                    = var.billing_account
  lien                               = var.lien
  enable_shared_vpc_host_project     = var.enable_shared_vpc_host_project
  svpc_host_project_id               = var.svpc_host_project_id
  shared_vpc_subnets                 = var.shared_vpc_subnets
  vpc_service_control_attach_enabled = var.vpc_service_control_attach_enabled
  vpc_service_control_perimeter_name = var.vpc_service_control_perimeter_name
  activate_apis                      = var.services
  disable_services_on_destroy        = var.disable_on_destroy
  disable_dependent_services         = var.disable_dependent_services
  auto_create_network                = false
  default_service_account            = var.default_service_account

  labels = module.labels.transformed_labels
}
