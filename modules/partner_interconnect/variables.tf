variable "project_id" {
  description = "The ID of the project in which the vlan atttachments will be created."
  type        = string
}

variable "region1" {
  type        = string
  description = "First subnet region. The Partner Interconnect module only configures two regions."
}

variable "region2" {
  type        = string
  description = "Second subnet region. The Partner Interconnect module only configures two regions."
}

variable "region1_router1_name" {
  type        = string
  description = "Name of the Router 1 for Region 1 where the attachment resides."
}

variable "region1_router2_name" {
  type        = string
  description = "Name of the Router 2 for Region 1 where the attachment resides."
}

variable "region2_router1_name" {
  type        = string
  description = "Name of the Router 1 for Region 2 where the attachment resides."
}

variable "region2_router2_name" {
  type        = string
  description = "Name of the Router 2 for Region 2 where the attachment resides"
}

variable "ia_name_prefix" {
  type        = string
  description = "Interconnect Attachment name prefix."
}

variable "activate" {
  description = "Activate Partner Interconnect attachments. Default value is false."
  type        = string
  default     = false
}
