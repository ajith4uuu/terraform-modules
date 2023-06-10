variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "GCP region for the VM"
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone for the VM"
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "Name of the VM instance"
}

variable "machine_type" {
  description = "Machine type for the VM"
  default     = "n1-standard-1"
}

variable "image" {
  description = "VM image"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "network" {
  description = "GCP network name"
}
