variable "project_id" {
  description = "The project ID where you want to create IAM permissions"
  type        = string
}

/*
You must prefix the type of member to be granted roles on any "members" inputs e.g. "sharedvpc_netuser_members".

Accepted values are user, serviceAccount, group, domain

Examples:

"serviceAccount:my-sa@my-project.iam.gserviceaccount.com"
"group:my-group@my-org.com"
"user:my-user@my-org.com"
*/

variable "sharedvpc_netuser_members" {
  description = "Members you wish to give network usage permission in a Shared VPC environment"
  type        = list(string)
  default     = []
}

variable "sharedvpc_netadmin_members" {
  description = "Members you wish to give network admin permission in a Shared VPC environment"
  type        = list(string)
  default     = []
}

variable "shared_vpc_subnets" {
  description = "List of target subnets fully qualified subnet IDs (ie. projects/$project_id/regions/$region/subnetworks/$subnet_id) to give permissions on"
  type        = list(string)
  default     = []
}
