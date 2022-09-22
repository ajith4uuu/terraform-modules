locals {
  svc_accounts = {
    for x in var.service_account_roles_map :
    "${var.project_id}/${x.sa_name}" => x
  }

  /*
This takes the list of maps for the service accounts like indicated in
variable service_account_roles_map and transforms it into a list
with the format required by the module, which is project-name=>role.
If there is a need to assign the IAM roles to the SA in another
project, then in the service_account_roles_map we could use the
roles_project key to indicate this. The transformation checks if this
key is present, and if it is, then uses <value-of-roles_project>=>role,
otherwise it uses <value-of-project_id>=>role

Example input:-
   {
      sa_name      = "myapp-sa"
      sa_role      = "roles/compute.networkUser,roles/storage.objectViewer"
      display_name = "My Application SA"
      description  = "My description"
    },
    {
      sa_name      = "myapp-sa-2"
      sa_role      = "roles/storage.objectCreator"
      display_name = "My SuperApp SA"
      description  = "My description 2"
      roles_project = "new-project-25t"
    }

Example output by sa_roles:-
saroles = [
  {
    "myapp-sa" = "the-project-id=>roles/compute.networkUser"
  },
  {
    "myapp-sa" = "the-project-id=>=>roles/storage.objectViewer"
  },
  {
    "myapp-sa-2" = "new-project-25t=>storage.objectCreator"
  },
]

*/

  sa_roles = distinct(flatten([
    for svc_acc in var.service_account_roles_map : [
      for svc_role in split(",", svc_acc["sa_role"]) : {
        "${svc_acc["sa_name"]}" = length(lookup(svc_acc, "roles_project", "")) > 0 ? length(svc_role) > 0 ? "${svc_acc["roles_project"]}=>${svc_role}" : "" : length(svc_role) > 0 ? "${var.project_id}=>${svc_role}" : ""
      }
    ]
  ]))

}


module "service_accounts" {
  source     = "github.com/terraform-google-modules/terraform-google-service-accounts?ref=v4.0.3"
  for_each   = local.svc_accounts
  project_id = var.project_id
  names      = [lookup(each.value, "sa_name", null)]
  project_roles = compact([
    for role in local.sa_roles :
    lookup(role, (lookup(each.value, "sa_name")), "")
  ])

  display_name    = lookup(each.value, "display_name", null)
  grant_xpn_roles = var.grant_xpn_roles
  org_id          = var.org_id
  generate_keys   = var.generate_keys
}
