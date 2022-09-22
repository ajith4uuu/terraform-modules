# Folder IAM

> Sets permissions on a folder level, with preset roles

## List of modules this stack deploys

- [Project IAM
  module](https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/folders_iam)
- Opinionated project roles of
  - `Editor`: Provides permission to modify folders as well as to view a
    folder's IAM policy.
  - `Viewer`: Provides permission to get a folder and list the folders and
    projects below a resource.

## Notes

- This module uses an
  [additive](https://github.com/terraform-google-modules/terraform-google-iam#additive-and-authoritative-modes)
  approach to IAM roles

- When adding members remember to prefix the type (e.g. group, user)
  - For example, `"group:my-group@my-org.com", "user:my-user@my-org.com"`

:warning: IAM permissions in GCP are inherited, i.e. whatever permissions
someone/thing gets at a folder level they have those same permissions on any
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
| <a name="module_admins"></a> [admins](#module\_admins) | github.com/terraform-google-modules/terraform-google-iam//modules/folders_iam | v7.2.0 |
| <a name="module_editors"></a> [editors](#module\_editors) | github.com/terraform-google-modules/terraform-google-iam//modules/folders_iam | v7.2.0 |
| <a name="module_viewers"></a> [viewers](#module\_viewers) | github.com/terraform-google-modules/terraform-google-iam//modules/folders_iam | v7.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_members"></a> [admin\_members](#input\_admin\_members) | Members you wish to give the folder admin role | `list(string)` | `[]` | no |
| <a name="input_editor_members"></a> [editor\_members](#input\_editor\_members) | Members you wish to give the folder editor role | `list(string)` | `[]` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder id to apply roles to | `string` | n/a | yes |
| <a name="input_viewer_members"></a> [viewer\_members](#input\_viewer\_members) | Members you wish to give the folder viewer role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admins"></a> [admins](#output\_admins) | All outputs from IAM module admins |
| <a name="output_editors"></a> [editors](#output\_editors) | All outputs from IAM module editors |
| <a name="output_viewers"></a> [viewers](#output\_viewers) | All outputs from IAM module viewers |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
