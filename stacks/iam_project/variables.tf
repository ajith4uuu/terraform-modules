variable "project_id" {
  description = "The project ID where you want to create IAM permissions"
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
  description = "Members you wish to give the project editor role"
  type        = list(string)
  default     = []
}

variable "viewer_members" {
  description = "Members you wish to give the project viewer role"
  type        = list(string)
  default     = []
}
