# Project IAM

> Sets permissions on a project level, with preset roles

## List of modules this stack deploys

- [Project IAM
  module](https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/projects_iam)
- Opinionated project roles of
  - `Editor`: Able to Create, Read, Update, and Delete resources and data
  - `Viewer`: Able to Read resources and data
  - Both are known as [primitive
    roles](https://cloud.google.com/iam/docs/understanding-roles#primitive_role_definitions)
- Additional [predefined
  roles](https://cloud.google.com/iam/docs/understanding-roles#cloud-iap-roles)
  to allow the use of Identity-Aware Proxy (IAP)

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
| <a name="module_editors"></a> [editors](#module\_editors) | github.com/terraform-google-modules/terraform-google-iam//modules/projects_iam | v7.2.0 |
| <a name="module_viewers"></a> [viewers](#module\_viewers) | github.com/terraform-google-modules/terraform-google-iam//modules/projects_iam | v7.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_editor_members"></a> [editor\_members](#input\_editor\_members) | Members you wish to give the project editor role | `list(string)` | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID where you want to create IAM permissions | `string` | n/a | yes |
| <a name="input_viewer_members"></a> [viewer\_members](#input\_viewer\_members) | Members you wish to give the project viewer role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_editors"></a> [editors](#output\_editors) | All outputs from IAM module editors |
| <a name="output_viewers"></a> [viewers](#output\_viewers) | All outputs from IAM module viewers |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
