locals {
  # Policy enforcement
  allow_list_domain_length             = length(regexall(".*all.*", join(",", var.policy_allowed_domain_ids))) > 0 ? 0 : length(var.policy_allowed_domain_ids)
  enforce_domain_policy                = local.allow_list_domain_length > 0 ? null : false
  allow_list_resource_locations_length = length(regexall(".*all.*", join(",", var.policy_resource_locations))) > 0 ? 0 : length(var.policy_resource_locations)
  enforce_resource_locations_policy    = local.allow_list_resource_locations_length > 0 ? null : false
}

# boolean policies
module "skip_default_network_policy" {
  source          = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for      = var.policy_for
  organization_id = var.org_id
  folder_id       = var.folder_id
  project_id      = var.project_id
  policy_type     = "boolean"
  enforce         = var.policy_skip_default_network
  constraint      = "compute.skipDefaultNetworkCreation"
}

module "oslogin_policy" {
  source          = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for      = var.policy_for
  organization_id = var.org_id
  folder_id       = var.folder_id
  project_id      = var.project_id
  policy_type     = "boolean"
  enforce         = var.policy_require_oslogin
  constraint      = "constraints/compute.requireOsLogin"
}

module "svc_acc_grants_policy" {
  source          = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for      = var.policy_for
  organization_id = var.org_id
  folder_id       = var.folder_id
  project_id      = var.project_id
  policy_type     = "boolean"
  enforce         = var.policy_svc_acc_grants
  constraint      = "iam.automaticIamGrantsForDefaultServiceAccounts"
}

module "uniform_bucket_policy" {
  source          = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for      = var.policy_for
  organization_id = var.org_id
  folder_id       = var.folder_id
  project_id      = var.project_id
  policy_type     = "boolean"
  enforce         = var.policy_uniform_bucket
  constraint      = "constraints/storage.uniformBucketLevelAccess"
}

# List policies
module "vm_external_ip_policy" {
  source          = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for      = var.policy_for
  organization_id = var.org_id
  folder_id       = var.folder_id
  project_id      = var.project_id
  policy_type     = "list"
  enforce         = var.policy_vm_external_ip
  constraint      = "constraints/compute.vmExternalIpAccess"
}

module "resource_locations_policy" {
  source            = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for        = var.policy_for
  organization_id   = var.org_id
  folder_id         = var.folder_id
  project_id        = var.project_id
  policy_type       = "list"
  allow             = var.policy_resource_locations
  enforce           = local.enforce_resource_locations_policy
  allow_list_length = local.allow_list_resource_locations_length
  constraint        = "constraints/gcp.resourceLocations"
}

module "cloud_identity_domain_policy" {
  source            = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for        = var.policy_for
  organization_id   = var.org_id
  folder_id         = var.folder_id
  project_id        = var.project_id
  policy_type       = "list"
  allow             = var.policy_allowed_domain_ids
  enforce           = local.enforce_domain_policy
  allow_list_length = local.allow_list_domain_length
  constraint        = "constraints/iam.allowedPolicyMemberDomains"
}

module "svc_disable_sa_key_creation" {
  source          = "github.com/terraform-google-modules/terraform-google-org-policy?ref=v5.0.0"
  policy_for      = var.policy_for
  organization_id = var.org_id
  folder_id       = var.folder_id
  project_id      = var.project_id
  policy_type     = "boolean"
  enforce         = var.policy_svc_acc_key_creation
  constraint      = "constraints/iam.disableServiceAccountKeyCreation"
}
