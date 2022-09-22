# Shared VPC IAM

> Sets permissions for users on a Shared VPC network, with preset roles. It can
> grant granular per-subnet permissions.

## Notes

- This module uses an
  [additive](https://github.com/terraform-google-modules/terraform-google-iam#additive-and-authoritative-modes)
  approach to IAM roles

- When adding members remember to prefix the type (e.g. group, user)
  - For example, `"group:my-group@my-org.com", "user:my-user@my-org.com"`

:warning: IAM permissions in GCP are inherited, i.e. whatever permissions
someone/thing gets at a project level they have those same permissions on any
child resource. :warning:

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.88.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.88.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_shared_vpc_network_admin"></a> [shared\_vpc\_network\_admin](#module\_shared\_vpc\_network\_admin) | github.com/terraform-google-modules/terraform-google-iam//modules/subnets_iam | v7.2.0 |
| <a name="module_shared_vpc_network_users"></a> [shared\_vpc\_network\_users](#module\_shared\_vpc\_network\_users) | github.com/terraform-google-modules/terraform-google-iam//modules/subnets_iam | v7.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID where you want to create IAM permissions | `string` | n/a | yes |
| <a name="input_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#input\_shared\_vpc\_subnets) | List of target subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) to give permissions on | `list(string)` | `[]` | no |
| <a name="input_sharedvpc_netadmin_members"></a> [sharedvpc\_netadmin\_members](#input\_sharedvpc\_netadmin\_members) | Members you wish to give network admin permission in a Shared VPC environment | `list(string)` | `[]` | no |
| <a name="input_sharedvpc_netuser_members"></a> [sharedvpc\_netuser\_members](#input\_sharedvpc\_netuser\_members) | Members you wish to give network usage permission in a Shared VPC environment | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_shared_vpc_network_admin"></a> [shared\_vpc\_network\_admin](#output\_shared\_vpc\_network\_admin) | All outputs from IAM module Shared VPC network admins |
| <a name="output_shared_vpc_network_users"></a> [shared\_vpc\_network\_users](#output\_shared\_vpc\_network\_users) | All outputs from IAM module Shared VPC network users |
| <a name="output_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#output\_shared\_vpc\_subnets) | List of target subnets to give permissions on |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
