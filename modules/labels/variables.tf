# Required
variable "prefix_id" {
  description = "4 chars prefix to uniquely identify Colt"
  type        = string
}
variable "live" {
  description = "Is this service live? Either yes OR no"
  type        = string
}
variable "environment" {
  description = "Short environment name e.g. dev, prd, sbx"
  type        = string
}
variable "servicename" {
  description = "Provide your service name e.g. purchase, ordering"
  type        = string
}
# Optional
variable "email" {
  description = "Optional, contact email for this GCP resource/project e.g. platform.support@colt.net"
  type        = string
  default     = ""
}
variable "costid" {
  description = "Optional, ID of the cost assigned to this GCP resource/project e.g. 419725"
  type        = string
  default     = ""
}
variable "subservicename" {
  description = "Optional, additional identifier for a service e.g. frontend will form {servicename}-frontend"
  type        = string
  default     = ""
}

# String transformation defaults
variable "transformation_regex" {
  description = <<EOF
  Regex used to transform labels
  Has two keys:
  not_allowed = is the regex to determine which characters should be removed, defaults to allow only lowercase, numeric, underscores, and hyphens
  replacement = is the character you want to replace removed characters with, defaults to empty (i.e. just remove the not allowed characters)
EOF
  type        = map(any)
  default = {
    not_allowed = "/[^a-z0-9-_]/"
    replacement = ""
  }
}
variable "email_dot_character" {
  description = "Character used to transform any . (dots) in the email label"
  type        = map(any)
  default = {
    original    = "."
    transformed = "ø"
  }
}
variable "email_at_character" {
  description = "Character used to transform any @ (at sign) in the email label"
  type        = map(any)
  default = {
    original    = "@"
    transformed = "λ"
  }
}
