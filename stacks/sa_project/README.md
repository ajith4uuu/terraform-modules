# Service Account IAM for projects

> Creates one or more service accounts in a project and grants them specific
> roles.

## List of modules this stack deploys

- [Service Accounts
  Module](https://github.com/terraform-google-modules/terraform-google-service-accounts)

## Notes

The IAM roles required to use this stack are:

- Service Account Admin: `roles/iam.serviceAccountAdmins`
- (optional) Service Account Key Admin: `roles/iam.serviceAccountKeyAdmin` when
  `generate_keys` is set to `true`
- (optional) roles needed to grant optional IAM roles at the project or
  organizational level

:warning: IAM permissions in GCP are inherited, i.e. whatever permissions
someone/thing gets at a project level they have those same permissions on any
child resource. :warning:

## Example

### Input

- Create a new directory called `sa_project` into the location of the target
  project (e.g `org/folder1/subfolder/cl-dev-myproject/sa_project`)
- Create a new `terragrunt.hcl` file into this new `sa_project` directory with
  the following content, making sure to replace the values between `<< >>`:

```hcl
locals {
}

terraform {
  source = <<"../../../../../..//terraform/stacks/sa_project/">>

}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders("org.hcl")
}

dependency "parent" {
  config_path = "../../<<cl-dev-myproject>>/"
  mock_outputs = {
    project = {
      project_id = "<<cl-dev-myproject>>"
    }
  }
}


# These are the variables we have to pass in to use the module specified above
inputs = {

  project_id = dependency.parent.outputs.project.project_id

  service_account_roles_map = [
    {
      sa_name      = "<<my-first-sa>>"
      sa_role      = "<<roles/myrole-1,roles/myrole-2>>"
      display_name = "<<My First SA>>"
      description  = "<<My first description>>"
    },
    {
      sa_name      = "<<my-second-sa>>"
      sa_role      = "<<roles/another-role>>"
      display_name = "<<My Second SA>>"
      description  = "<<My second description>>"
    }
  ]

}
```

- The `service_account_roles_map` variable allows you to specify multiple
  Service Accounts if needed, or only one. The example above will create two
  Service Accounts.

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
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | github.com/terraform-google-modules/terraform-google-service-accounts | v4.0.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_generate_keys"></a> [generate\_keys](#input\_generate\_keys) | Generate keys for service accounts. | `bool` | `false` | no |
| <a name="input_grant_xpn_roles"></a> [grant\_xpn\_roles](#input\_grant\_xpn\_roles) | Grant roles for shared VPC management. | `bool` | `false` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Id of the organization for org-level roles. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where service account will be created. | `string` | n/a | yes |
| <a name="input_service_account_roles_map"></a> [service\_account\_roles\_map](#input\_service\_account\_roles\_map) | Map with list of Service Accounts to create and their roles.<br>  This stack also supports assigning IAM roles<br>    for Service Accounts into other projects.<br>  Usage example with creating SA and giving IAM roles into the same project:<br>  service\_account\_roles\_map = [<br>    {<br>      sa\_name      = "tests-sa"<br>      sa\_role      = "roles/compute.edit,roles/storage.view"<br>      display\_name = "Test SA"<br>      description  = "My description"<br>    }<br>  ]<br><br>  Usage example with creating SA into a project and giving it IAM roles into another project:<br>  service\_account\_roles\_map = [<br>    {<br>      sa\_name         = "tests-sa"<br>      sa\_role         = ""<br>      roles\_project   = "my-target-project"<br>      display\_name    = "Test SA"<br>      description     = "My description"<br>    }<br>  ] | `list(map(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | All outputs from Service Accounts module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
