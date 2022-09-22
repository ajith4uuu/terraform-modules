variable "project_id" {
  type        = string
  description = "Project id where service account will be created."
}

variable "service_account_roles_map" {
  type        = list(map(string))
  description = <<EOF
  Map with list of Service Accounts to create and their roles.
  This stack also supports assigning IAM roles
    for Service Accounts into other projects.
  Usage example with creating SA and giving IAM roles into the same project:
  service_account_roles_map = [
    {
      sa_name      = "tests-sa"
      sa_role      = "roles/compute.edit,roles/storage.view"
      display_name = "Test SA"
      description  = "My description"
    }
  ]

  Usage example with creating SA into a project and giving it IAM roles into another project:
  service_account_roles_map = [
    {
      sa_name         = "tests-sa"
      sa_role         = ""
      roles_project   = "my-target-project"
      display_name    = "Test SA"
      description     = "My description"
    }
  ]
EOF
  validation {
    condition     = length(flatten([for s in var.service_account_roles_map : regexall("(?i)roles/[a-zA-Z]+\\.[a-zA-Z]*admin|roles/[a-zA-Z]+\\.[a-zA-Z]*owner|roles/billing\\.|roles/iam.serviceAccountTokenCreator|roles/owner|roles/editor", join(";", values(s)))])) < 1
    error_message = "You are not allowed to use admin/editor/owner roles for the Service Accounts."
  }
}

variable "grant_xpn_roles" {
  type        = bool
  description = "Grant roles for shared VPC management."
  default     = false
}

variable "org_id" {
  type        = string
  description = "Id of the organization for org-level roles."
  default     = ""
}

variable "generate_keys" {
  type        = bool
  description = "Generate keys for service accounts."
  default     = false
}
