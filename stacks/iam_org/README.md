# Organisation IAM

> Sets permissions on an organisation level, with preset groups

## List of modules this stack deploys

- [Org IAM
  module](https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/organizations_iam)
- Opinionated Org groups of
  - Organisation admins
  - Security admins
  - Billing admins
  - Billing users
- Gives all Cloud Identity users the ability to see the organisation and folder
  structure

## Notes

- This module uses an
  [additive](https://github.com/terraform-google-modules/terraform-google-iam#additive-and-authoritative-modes)
  approach to IAM roles

- When adding members remember to prefix the type (e.g. group, user)
  - For example, `"group:my-group@my-org.com", "user:my-user@my-org.com"`

:warning: IAM permissions in GCP are inherited, i.e. whatever permissions
someone/thing gets at an organisation level they have those same permissions on
any child folder, project, resource level. The organisation is the highest level
of the hierarchy in GCP :warning:

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
| <a name="module_all_users"></a> [all\_users](#module\_all\_users) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |
| <a name="module_billing_admin"></a> [billing\_admin](#module\_billing\_admin) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |
| <a name="module_billing_user"></a> [billing\_user](#module\_billing\_user) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |
| <a name="module_net_admin"></a> [net\_admin](#module\_net\_admin) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |
| <a name="module_org_admin"></a> [org\_admin](#module\_org\_admin) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |
| <a name="module_sec_admin"></a> [sec\_admin](#module\_sec\_admin) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |
| <a name="module_support_account_admin"></a> [support\_account\_admin](#module\_support\_account\_admin) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |
| <a name="module_tech_support_editor"></a> [tech\_support\_editor](#module\_tech\_support\_editor) | github.com/terraform-google-modules/terraform-google-iam//modules/organizations_iam | v7.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_admin_members"></a> [billing\_admin\_members](#input\_billing\_admin\_members) | Members you wish to give billing admin roles | `list(string)` | n/a | yes |
| <a name="input_billing_admin_roles"></a> [billing\_admin\_roles](#input\_billing\_admin\_roles) | List of roles granted to billing admins | `list(string)` | <pre>[<br>  "roles/billing.admin",<br>  "roles/billing.creator"<br>]</pre> | no |
| <a name="input_billing_user_members"></a> [billing\_user\_members](#input\_billing\_user\_members) | Members you wish to give billing user roles | `list(string)` | n/a | yes |
| <a name="input_billing_user_roles"></a> [billing\_user\_roles](#input\_billing\_user\_roles) | List of roles granted to billing users | `list(string)` | <pre>[<br>  "roles/billing.viewer"<br>]</pre> | no |
| <a name="input_network_admin_members"></a> [network\_admin\_members](#input\_network\_admin\_members) | Members you wish to give network admin roles | `list(string)` | n/a | yes |
| <a name="input_network_admin_roles"></a> [network\_admin\_roles](#input\_network\_admin\_roles) | List of roles granted to network admin users | `list(string)` | <pre>[<br>  "roles/compute.xpnAdmin",<br>  "roles/owner"<br>]</pre> | no |
| <a name="input_org_admin_members"></a> [org\_admin\_members](#input\_org\_admin\_members) | Members you wish to give org admin roles | `list(string)` | n/a | yes |
| <a name="input_org_admin_roles"></a> [org\_admin\_roles](#input\_org\_admin\_roles) | List of roles granted to org admins | `list(string)` | <pre>[<br>  "roles/resourcemanager.organizationAdmin",<br>  "roles/resourcemanager.folderAdmin",<br>  "roles/resourcemanager.projectCreator",<br>  "roles/billing.user",<br>  "roles/iam.organizationRoleAdmin"<br>]</pre> | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization id for the associated resource/module | `string` | n/a | yes |
| <a name="input_sec_admin_members"></a> [sec\_admin\_members](#input\_sec\_admin\_members) | Members you wish to give security admin roles | `list(string)` | n/a | yes |
| <a name="input_sec_admin_roles"></a> [sec\_admin\_roles](#input\_sec\_admin\_roles) | List of roles granted to security admins | `list(string)` | <pre>[<br>  "roles/logging.viewer"<br>]</pre> | no |
| <a name="input_support_account_admin_members"></a> [support\_account\_admin\_members](#input\_support\_account\_admin\_members) | Members you wish to give support account admin roles | `list(string)` | n/a | yes |
| <a name="input_support_account_admin_roles"></a> [support\_account\_admin\_roles](#input\_support\_account\_admin\_roles) | List of roles granted to support account admin users | `list(string)` | <pre>[<br>  "roles/cloudsupport.admin"<br>]</pre> | no |
| <a name="input_tech_support_editor_members"></a> [tech\_support\_editor\_members](#input\_tech\_support\_editor\_members) | Members you wish to give Tech Support Editor role | `list(string)` | n/a | yes |
| <a name="input_tech_support_editor_roles"></a> [tech\_support\_editor\_roles](#input\_tech\_support\_editor\_roles) | List of roles granted to Tech Support Editor users | `list(string)` | <pre>[<br>  "roles/cloudsupport.techSupportEditor"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_users"></a> [all\_users](#output\_all\_users) | All outputs from IAM module |
| <a name="output_billing_admin"></a> [billing\_admin](#output\_billing\_admin) | All outputs from IAM module |
| <a name="output_billing_user"></a> [billing\_user](#output\_billing\_user) | All outputs from IAM module |
| <a name="output_net_admin"></a> [net\_admin](#output\_net\_admin) | All outputs from IAM module |
| <a name="output_org_admin"></a> [org\_admin](#output\_org\_admin) | All outputs from IAM module |
| <a name="output_sec_admin"></a> [sec\_admin](#output\_sec\_admin) | All outputs from IAM module |
| <a name="output_support_account_admin"></a> [support\_account\_admin](#output\_support\_account\_admin) | All outputs from IAM module |
| <a name="output_tech_support_editor"></a> [tech\_support\_editor](#output\_tech\_support\_editor) | All outputs from IAM module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
