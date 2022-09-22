variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "global_address_name" {
  description = "Global address name used for private services"
  type        = string
}

variable "network_name" {
  description = "The URL of the network in which to reserve the IP range. The IP range must be in RFC1918 space. The network cannot be deleted if there are any reserved IP ranges referring to it."
  type        = string
}

variable "prefix_length" {
  description = "The prefix length of the IP range. If not present, it means the address field is a single IP address."
  type        = string
}

variable "address" {
  description = "The IP address or beginning of the address range represented by this resource. This can be supplied as an input to reserve a specific address or omitted to allow GCP to choose a valid one for you."
  type        = string
}

variable "prefix_id" {
  description = "4 chars prefix to uniquely identify Colt"
  type        = string
}
