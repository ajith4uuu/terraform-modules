# VPC Peering

This modules allows creation of a [VPC Network
Peering](https://cloud.google.com/vpc/docs/vpc-peering) between two networks.

The resources created/managed by this module are:

- one network peering from `local network` to `peer network`
- one network peering from `peer network` to `local network`

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.88.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.88.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_peering"></a> [peering](#module\_peering) | github.com/terraform-google-modules/terraform-google-network//modules/network-peering | v3.4.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_export_local_custom_routes"></a> [export\_local\_custom\_routes](#input\_export\_local\_custom\_routes) | Export custom routes to peer network from local network. | `bool` | `false` | no |
| <a name="input_export_peer_custom_routes"></a> [export\_peer\_custom\_routes](#input\_export\_peer\_custom\_routes) | Export custom routes to local network from peer network. | `bool` | `false` | no |
| <a name="input_local_network"></a> [local\_network](#input\_local\_network) | Resource link of the network to add a peering to. | `string` | n/a | yes |
| <a name="input_peer_network"></a> [peer\_network](#input\_peer\_network) | Resource link of the peer network. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix for the network peerings | `string` | `"network-peering"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc-peering"></a> [vpc-peering](#output\_vpc-peering) | All outputs from the peering module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
