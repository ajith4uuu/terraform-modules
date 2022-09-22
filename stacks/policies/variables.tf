variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of organization, folder, or project"
  type        = string
}

variable "org_id" {
  description = "The organization id to apply policies to"
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The folder id to apply policies to"
  type        = string
  default     = null
}

variable "project_id" {
  description = "The project id to apply policies to"
  type        = string
  default     = null
}

variable "policy_skip_default_network" {
  description = "Sets skip default network policy creation on projects if true"
  type        = bool
  default     = true
}

variable "policy_require_oslogin" {
  description = "Sets the enforcement of OSLogin on compute if true"
  type        = bool
  default     = true
}

variable "policy_uniform_bucket" {
  description = "Sets uniform level access to buckets if true"
  type        = bool
  default     = true
}

variable "policy_svc_acc_grants" {
  description = "The default service account is created without any IAM permissions. "
  type        = bool
  default     = true
}

variable "policy_resource_locations" {
  description = "(Only for list constraints) List of locations to allow resource creation"
  type        = list(string)
  default     = []
}

variable "policy_vm_external_ip" {
  description = "Allow or deny for the VMs to have external IP. Default is to deny"
  type        = bool
  default     = true
}

# Get customer ids using: https://cloud.google.com/resource-manager/docs/organization-policy/restricting-domains#retrieving_customer_id
variable "policy_allowed_domain_ids" {
  description = "(Only for list constraints) List of cloud identity domain ids allowed access"
  type        = list(string)
}

variable "policy_svc_acc_key_creation" {
  description = "Disables the feature that allows creating public key to service account if true"
  type        = bool
  default     = true
}
