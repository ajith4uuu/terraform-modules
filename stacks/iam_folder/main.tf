locals {

  # Create an IAM bindings map as per: https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/projects_iam#example-usage
  # Used technique found here: https://github.com/hashicorp/terraform/issues/22263#issuecomment-516900149
  # More info on for expressions: https://www.terraform.io/docs/configuration/expressions.html#for-expressions

  editor_roles = [
    "roles/resourcemanager.folderEditor",
    "roles/resourcemanager.projectCreator",
    "roles/iam.securityAdmin",
    "roles/owner"
  ]

  viewer_roles = [
    "roles/resourcemanager.folderViewer"
  ]

  admin_roles = [
    "roles/resourcemanager.folderAdmin"
  ]

  editor_bindings = {
    for role in local.editor_roles :
    role => var.editor_members
  }

  viewer_bindings = {
    for role in local.viewer_roles :
    role => var.viewer_members
  }

  admin_bindings = {
    for role in local.admin_roles :
    role => var.admin_members
  }

}

module "editors" {
  count    = length(var.editor_members) > 0 ? 1 : 0
  source   = "github.com/terraform-google-modules/terraform-google-iam//modules/folders_iam?ref=v7.2.0"
  folders  = [var.folder_id]
  mode     = "additive"
  bindings = local.editor_bindings
}

module "viewers" {
  count    = length(var.viewer_members) > 0 ? 1 : 0
  source   = "github.com/terraform-google-modules/terraform-google-iam//modules/folders_iam?ref=v7.2.0"
  folders  = [var.folder_id]
  mode     = "additive"
  bindings = local.viewer_bindings
}

module "admins" {
  count    = length(var.admin_members) > 0 ? 1 : 0
  source   = "github.com/terraform-google-modules/terraform-google-iam//modules/folders_iam?ref=v7.2.0"
  folders  = [var.folder_id]
  mode     = "additive"
  bindings = local.admin_bindings
}
