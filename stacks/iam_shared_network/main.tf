locals {

  # Create an IAM bindings map as per: https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/projects_iam#example-usage
  # Used technique found here: https://github.com/hashicorp/terraform/issues/22263#issuecomment-516900149
  # More info on for expressions: https://www.terraform.io/docs/configuration/expressions.html#for-expressions

  sharedvpc_netuser_role = ["roles/compute.networkUser"]
  sharedvpc_netadmin_role = [
    "roles/compute.networkAdmin"
  ]

  sharedvpc_netuser_bindings = {
    for role in local.sharedvpc_netuser_role :
    role => var.sharedvpc_netuser_members
  }
  sharedvpc_netadmin_bindings = {
    for role in local.sharedvpc_netadmin_role :
    role => var.sharedvpc_netadmin_members
  }

  sharedvpc_netuser_subnetwork_access  = length(var.shared_vpc_subnets) != 0 && length(var.sharedvpc_netuser_members) > 0 ? tolist(var.shared_vpc_subnets) : []
  sharedvpc_netadmin_subnetwork_access = length(var.shared_vpc_subnets) != 0 && length(var.sharedvpc_netadmin_members) > 0 ? tolist(var.shared_vpc_subnets) : []

}

module "shared_vpc_network_users" {
  source  = "github.com/terraform-google-modules/terraform-google-iam//modules/subnets_iam?ref=v7.2.0"
  count   = length(local.sharedvpc_netuser_subnetwork_access)
  project = var.project_id

  subnets = [element(
    split("/", local.sharedvpc_netuser_subnetwork_access[count.index]),
  index(split("/", local.sharedvpc_netuser_subnetwork_access[count.index]), "subnetworks", ) + 1, )]

  subnets_region = element(
    split("/", local.sharedvpc_netuser_subnetwork_access[count.index]),
  index(split("/", local.sharedvpc_netuser_subnetwork_access[count.index]), "regions") + 1, )

  mode     = "additive"
  bindings = local.sharedvpc_netuser_bindings

}

module "shared_vpc_network_admin" {
  source  = "github.com/terraform-google-modules/terraform-google-iam//modules/subnets_iam?ref=v7.2.0"
  count   = length(local.sharedvpc_netadmin_subnetwork_access)
  project = var.project_id

  subnets = [element(
    split("/", local.sharedvpc_netadmin_subnetwork_access[count.index]),
  index(split("/", local.sharedvpc_netadmin_subnetwork_access[count.index]), "subnetworks", ) + 1, )]

  subnets_region = element(
    split("/", local.sharedvpc_netadmin_subnetwork_access[count.index]),
  index(split("/", local.sharedvpc_netadmin_subnetwork_access[count.index]), "regions") + 1, )

  mode     = "additive"
  bindings = local.sharedvpc_netadmin_bindings

}
