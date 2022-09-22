variable "prefix_id" {
  description = "4 chars prefix to uniquely identify Colt"
  type        = string
}

variable "labels" {
  description = <<EOF
  Map of labels (i.e. tags) to add to project for billing purposes
  Required labels example:
  labels = {
    email       = "platform.support@colt.net"
    costid      = "34623"
    live        = "no"
    environment = "dev"
    servicename = "myservice"
  }
EOF
  type        = map(string)
}

variable "project_id" {
  description = "Project ID where the Cloud Routers and VLAN attachments will be created"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network that will be used by the Cloud Routers and VLAN attachments"
  type        = string
}

variable "region1" {
  description = "1st region where the Cloud Routers and VLAN attachments will be created"
  type        = string
}

variable "region2" {
  description = "2nd region where the Cloud Routers and VLAN attachments will be created"
  type        = string
}

variable "router_advertise_config" {
  description = "Router custom advertisement configuration, ip_ranges is a map of address ranges and descriptions."
  type = object({
    groups    = list(string)
    ip_ranges = map(string)
    mode      = string
  })
  default = null
}

variable "activate" {
  description = "Activate Partner Interconnect attachments. Default value is false."
  type        = string
  default     = false
}
