# Private Service Access

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.88.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.main_ip_alloc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_project_service.enable_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_networking_connection.main_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address"></a> [address](#input\_address) | The IP address or beginning of the address range represented by this resource. This can be supplied as an input to reserve a specific address or omitted to allow GCP to choose a valid one for you. | `string` | n/a | yes |
| <a name="input_global_address_name"></a> [global\_address\_name](#input\_global\_address\_name) | Global address name used for private services | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The URL of the network in which to reserve the IP range. The IP range must be in RFC1918 space. The network cannot be deleted if there are any reserved IP ranges referring to it. | `string` | n/a | yes |
| <a name="input_prefix_id"></a> [prefix\_id](#input\_prefix\_id) | 4 chars prefix to uniquely identify Colt | `string` | n/a | yes |
| <a name="input_prefix_length"></a> [prefix\_length](#input\_prefix\_length) | The prefix length of the IP range. If not present, it means the address field is a single IP address. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_main_connector"></a> [main\_connector](#output\_main\_connector) | Service Networking Connection |
| <a name="output_main_ip_alloc"></a> [main\_ip\_alloc](#output\_main\_ip\_alloc) | Global Address resource |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
