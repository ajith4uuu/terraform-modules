# GCP Router

This modules allows creation of a VPC router in the target project and network.

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.88.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.88.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.21.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_router) | resource |
| [google_compute_router_nat.nats](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nats"></a> [nats](#input\_nats) | NATs to deploy on this router. | `any` | `[]` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC network | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID where Cloud Router will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where Cloud Router will be created | `string` | n/a | yes |
| <a name="input_router_advertise_config"></a> [router\_advertise\_config](#input\_router\_advertise\_config) | Router custom advertisement configuration, ip\_ranges is a map of address ranges and descriptions. | <pre>object({<br>    groups    = list(string)<br>    ip_ranges = map(string)<br>    mode      = string<br>  })</pre> | `null` | no |
| <a name="input_router_asn"></a> [router\_asn](#input\_router\_asn) | Router ASN used for the created router. | `number` | `64514` | no |
| <a name="input_router_name"></a> [router\_name](#input\_router\_name) | Name of router, leave blank to create one. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nats_info"></a> [nats\_info](#output\_nats\_info) | NATs details |
| <a name="output_router_info"></a> [router\_info](#output\_router\_info) | GCP Router details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
