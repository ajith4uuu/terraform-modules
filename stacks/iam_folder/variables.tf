variable "folder_id" {
  description = "The folder id to apply roles to"
  type        = string
}

/*
You must prefix the type of member to be granted roles on any "members" inputs e.g. "editor_members".

Accepted values are user, serviceAccount, group, domain

Examples:

"serviceAccount:my-sa@my-project.iam.gserviceaccount.com"
"group:my-group@my-org.com"
"user:my-user@my-org.com"
*/

variable "editor_members" {
  description = "Members you wish to give the folder editor role"
  type        = list(string)
  default     = []
}

variable "viewer_members" {
  description = "Members you wish to give the folder viewer role"
  type        = list(string)
  default     = []
}

variable "admin_members" {
  description = "Members you wish to give the folder admin role"
  type        = list(string)
  default     = []
}
