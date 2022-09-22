locals {

  # Create an IAM bindings map as per: https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/organizations_iam#example-usage
  # Used technique found here: https://github.com/hashicorp/terraform/issues/22263#issuecomment-516900149
  # More info on for expressions: https://www.terraform.io/docs/configuration/expressions.html#for-expressions

  org_admin_bindings = {
    for role in var.org_admin_roles :
    role => var.org_admin_members
  }
  sec_admin_bindings = {
    for role in var.sec_admin_roles :
    role => var.sec_admin_members
  }
  billing_admin_bindings = {
    for role in var.billing_admin_roles :
    role => var.billing_admin_members
  }
  billing_user_bindings = {
    for role in var.billing_user_roles :
    role => var.billing_user_members
  }
  network_admin_bindings = {
    for role in var.network_admin_roles :
    role => var.network_admin_members
  }
  support_account_admin_bindings = {
    for role in var.support_account_admin_roles :
    role => var.support_account_admin_members
  }
  tech_support_editor_bindings = {
    for role in var.tech_support_editor_roles :
    role => var.tech_support_editor_members
  }
}

module "org_admin" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings      = local.org_admin_bindings
}

module "sec_admin" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings      = local.sec_admin_bindings
}

module "billing_admin" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings      = local.billing_admin_bindings
}

module "billing_user" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings      = local.billing_user_bindings
}

module "net_admin" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings      = local.network_admin_bindings
}

module "support_account_admin" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings      = local.support_account_admin_bindings
}

module "tech_support_editor" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings      = local.tech_support_editor_bindings
}

module "all_users" {
  source        = "github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam?ref=v7.2.0"
  organizations = [var.org_id]
  mode          = "additive"
  bindings = {
    "roles/resourcemanager.organizationViewer" = [
      "domain:colt.net",
    ]
    "roles/resourcemanager.folderViewer" = [
      "domain:colt.net",
    ]
  }
}
