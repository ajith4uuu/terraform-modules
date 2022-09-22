variable "org_id" {
  description = "The organization id for the associated resource/module"
  type        = string
}

/*
You must prefix the type of member to be granted roles on any "members" inputs e.g. "org_admin_members".

Accepted values are user, serviceAccount, group, domain

Examples:

"serviceAccount:my-sa@my-project.iam.gserviceaccount.com"
"group:my-group@my-org.com"
"user:my-user@my-org.com"
*/

variable "org_admin_members" {
  description = "Members you wish to give org admin roles"
  type        = list(string)
}

variable "org_admin_roles" {
  description = "List of roles granted to org admins"
  type        = list(string)
  default = [
    "roles/resourcemanager.organizationAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.projectCreator",
    "roles/billing.user",
    "roles/iam.organizationRoleAdmin"
  ]
}

variable "sec_admin_members" {
  description = "Members you wish to give security admin roles"
  type        = list(string)
}
variable "sec_admin_roles" {
  description = "List of roles granted to security admins"
  type        = list(string)
  default = [
    "roles/logging.viewer",
  ]
}

variable "billing_admin_members" {
  description = "Members you wish to give billing admin roles"
  type        = list(string)
}
variable "billing_admin_roles" {
  description = "List of roles granted to billing admins"
  type        = list(string)
  default = [
    "roles/billing.admin",
    "roles/billing.creator"
  ]
}

variable "billing_user_members" {
  description = "Members you wish to give billing user roles"
  type        = list(string)
}
variable "billing_user_roles" {
  description = "List of roles granted to billing users"
  type        = list(string)
  default = [
    "roles/billing.viewer"
  ]
}

variable "network_admin_members" {
  description = "Members you wish to give network admin roles"
  type        = list(string)
}
variable "network_admin_roles" {
  description = "List of roles granted to network admin users"
  type        = list(string)
  default = [
    "roles/compute.xpnAdmin",
    "roles/owner"
  ]
}

variable "support_account_admin_members" {
  description = "Members you wish to give support account admin roles"
  type        = list(string)
}
variable "support_account_admin_roles" {
  description = "List of roles granted to support account admin users"
  type        = list(string)
  default = [
    "roles/cloudsupport.admin"
  ]
}

variable "tech_support_editor_members" {
  description = "Members you wish to give Tech Support Editor role"
  type        = list(string)
}
variable "tech_support_editor_roles" {
  description = "List of roles granted to Tech Support Editor users"
  type        = list(string)
  default = [
    "roles/cloudsupport.techSupportEditor"
  ]
}
