# Interconnect

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.88.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_interconnect"></a> [interconnect](#module\_interconnect) | ../..//modules/partner_interconnect | n/a |
| <a name="module_labels"></a> [labels](#module\_labels) | ../..//modules/labels | n/a |
| <a name="module_region1_router1"></a> [region1\_router1](#module\_region1\_router1) | ../../modules/router | n/a |
| <a name="module_region1_router2"></a> [region1\_router2](#module\_region1\_router2) | ../../modules/router | n/a |
| <a name="module_region2_router1"></a> [region2\_router1](#module\_region2\_router1) | ../../modules/router | n/a |
| <a name="module_region2_router2"></a> [region2\_router2](#module\_region2\_router2) | ../../modules/router | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate"></a> [activate](#input\_activate) | Activate Partner Interconnect attachments. Default value is false. | `string` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels (i.e. tags) to add to project for billing purposes<br>  Required labels example:<br>  labels = {<br>    email       = "platform.support@colt.net"<br>    costid      = "34623"<br>    live        = "no"<br>    environment = "dev"<br>    servicename = "myservice"<br>  } | `map(string)` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC network that will be used by the Cloud Routers and VLAN attachments | `string` | n/a | yes |
| <a name="input_prefix_id"></a> [prefix\_id](#input\_prefix\_id) | 4 chars prefix to uniquely identify Colt | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID where the Cloud Routers and VLAN attachments will be created | `string` | n/a | yes |
| <a name="input_region1"></a> [region1](#input\_region1) | 1st region where the Cloud Routers and VLAN attachments will be created | `string` | n/a | yes |
| <a name="input_region2"></a> [region2](#input\_region2) | 2nd region where the Cloud Routers and VLAN attachments will be created | `string` | n/a | yes |
| <a name="input_router_advertise_config"></a> [router\_advertise\_config](#input\_router\_advertise\_config) | Router custom advertisement configuration, ip\_ranges is a map of address ranges and descriptions. | <pre>object({<br>    groups    = list(string)<br>    ip_ranges = map(string)<br>    mode      = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_interconnect_details"></a> [interconnect\_details](#output\_interconnect\_details) | interconnect details |
| <a name="output_labels"></a> [labels](#output\_labels) | All outputs from labels module |
| <a name="output_region1_router1_details"></a> [region1\_router1\_details](#output\_region1\_router1\_details) | Region1-Router1 details |
| <a name="output_region1_router2_details"></a> [region1\_router2\_details](#output\_region1\_router2\_details) | Region1-Router2 details |
| <a name="output_region2_router1_details"></a> [region2\_router1\_details](#output\_region2\_router1\_details) | Region2-Router1 details |
| <a name="output_region2_router2_details"></a> [region2\_router2\_details](#output\_region2\_router2\_details) | Region2-Router2 details |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
