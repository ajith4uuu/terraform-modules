# Partner Interconnect

This module is used to create 4 vlan attachments of type `PARTNER` in 2
different regions in order to achieve 99.99% availability of the service.

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
| [google_compute_interconnect_attachment.interconnect_attachment1_region1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect_attachment) | resource |
| [google_compute_interconnect_attachment.interconnect_attachment1_region2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect_attachment) | resource |
| [google_compute_interconnect_attachment.interconnect_attachment2_region1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect_attachment) | resource |
| [google_compute_interconnect_attachment.interconnect_attachment2_region2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate"></a> [activate](#input\_activate) | Activate Partner Interconnect attachments. Default value is false. | `string` | `false` | no |
| <a name="input_ia_name_prefix"></a> [ia\_name\_prefix](#input\_ia\_name\_prefix) | Interconnect Attachment name prefix. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the vlan atttachments will be created. | `string` | n/a | yes |
| <a name="input_region1"></a> [region1](#input\_region1) | First subnet region. The Partner Interconnect module only configures two regions. | `string` | n/a | yes |
| <a name="input_region1_router1_name"></a> [region1\_router1\_name](#input\_region1\_router1\_name) | Name of the Router 1 for Region 1 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region1_router2_name"></a> [region1\_router2\_name](#input\_region1\_router2\_name) | Name of the Router 2 for Region 1 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region2"></a> [region2](#input\_region2) | Second subnet region. The Partner Interconnect module only configures two regions. | `string` | n/a | yes |
| <a name="input_region2_router1_name"></a> [region2\_router1\_name](#input\_region2\_router1\_name) | Name of the Router 1 for Region 2 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region2_router2_name"></a> [region2\_router2\_name](#input\_region2\_router2\_name) | Name of the Router 2 for Region 2 where the attachment resides | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_interconnect_attachment1_region1"></a> [interconnect\_attachment1\_region1](#output\_interconnect\_attachment1\_region1) | Interconnect details for attachment1 from region1. |
| <a name="output_interconnect_attachment1_region2"></a> [interconnect\_attachment1\_region2](#output\_interconnect\_attachment1\_region2) | Interconnect details for attachment1 from region2. |
| <a name="output_interconnect_attachment2_region1"></a> [interconnect\_attachment2\_region1](#output\_interconnect\_attachment2\_region1) | Interconnect details for attachment2 from region1. |
| <a name="output_interconnect_attachment2_region2"></a> [interconnect\_attachment2\_region2](#output\_interconnect\_attachment2\_region2) | Interconnect details for attachment2 from region2. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
