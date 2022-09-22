locals {

  # Create an IAM bindings map as per: https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/projects_iam#example-usage
  # Used technique found here: https://github.com/hashicorp/terraform/issues/22263#issuecomment-516900149
  # More info on for expressions: https://www.terraform.io/docs/configuration/expressions.html#for-expressions

  editor_roles = [
    "roles/editor",
    "roles/iap.httpsResourceAccessor",
    "roles/iap.tunnelResourceAccessor",
    "roles/compute.osAdminLogin",
    "roles/iam.securityAdmin"
  ]

  viewer_roles = [
    "roles/viewer",
    "roles/iap.httpsResourceAccessor",
    "roles/compute.networkViewer",
    "roles/compute.osAdminLogin",
    "roles/iap.tunnelResourceAccessor"
  ]

  editor_bindings = {
    for role in local.editor_roles :
    role => var.editor_members
  }

  viewer_bindings = {
    for role in local.viewer_roles :
    role => var.viewer_members
  }

}

module "editors" {
  count    = length(var.editor_members) > 0 ? 1 : 0
  source   = "github.com/terraform-google-modules/terraform-google-iam//modules/projects_iam?ref=v7.2.0"
  projects = [var.project_id]
  mode     = "additive"
  bindings = local.editor_bindings
}

module "viewers" {
  count    = length(var.viewer_members) > 0 ? 1 : 0
  source   = "github.com/terraform-google-modules/terraform-google-iam//modules/projects_iam?ref=v7.2.0"
  projects = [var.project_id]
  mode     = "additive"
  bindings = local.viewer_bindings
}
