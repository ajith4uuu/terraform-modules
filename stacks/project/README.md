# Project

> Creates a GCP project with a standardised and unique name, and enables common
service APIs

## List of resources created

- [`google_project`](https://www.terraform.io/docs/providers/google/r/google_project.html)
- [`google_project_service`](https://www.terraform.io/docs/providers/google/r/google_project_service.html)
  i.e. Service APIs e.g. `compute.googleapis.com`
- Set of labels and resource names from the `labels` module

## Example

```hcl
module "project" {
  source = "./project"

  billing_account = "01FB95-6H2A14-3D7550"
  folder_id       = "140923452978"

  labels = {
    email       = "platform.support@colt.net"
    costid      = "34623"
    live        = "no"
    iac         = "automatic"
    environment = "dev"
    servicename = "myservice"
  }
}
```

## Example with project ID override

```hcl
module "project" {
  source = "./project"

  # Must be globally unique in GCP
  project_id_override = "gclt-dev-myservice-21b2"

  billing_account     = "01FB95-6H2A14-3D7550"
  folder_id           = "140923452978"

  labels = {
    email       = "platform.support@colt.net"
    costid      = "34623"
    live        = "no"
    iac         = "automatic"
    environment = "dev"
    servicename = "myservice"
  }
}
```

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.88.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.88.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | ../..//modules/labels | n/a |
| <a name="module_project"></a> [project](#module\_project) | github.com/terraform-google-modules/terraform-google-project-factory | v11.2.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account this project belongs to | `string` | n/a | yes |
| <a name="input_default_service_account"></a> [default\_service\_account](#input\_default\_service\_account) | Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`. | `string` | `"deprivilege"` | no |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services | `bool` | `true` | no |
| <a name="input_disable_on_destroy"></a> [disable\_on\_destroy](#input\_disable\_on\_destroy) | Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy | `bool` | `true` | no |
| <a name="input_enable_shared_vpc_host_project"></a> [enable\_shared\_vpc\_host\_project](#input\_enable\_shared\_vpc\_host\_project) | If this project is a shared VPC host project. | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of the folder this project should be created under.<br>  Only one of organisation\_id or folder\_id may be specified.<br>  If the folder\_id is specified, then the project is created under the specified folder. | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels (i.e. tags) to add to project for billing purposes<br>  Required labels example:<br>  labels = {<br>    email       = "platform.support@colt.net"<br>    costid      = "34623"<br>    live        = "no"<br>    environment = "dev"<br>    servicename = "myservice"<br>  } | `map(string)` | n/a | yes |
| <a name="input_lien"></a> [lien](#input\_lien) | Add a lien on the project to prevent accidental deletion | `bool` | `false` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID this project belongs to.<br>  Only one of organisation\_id or folder\_id may be specified.<br>  If the organisation\_id is specified then the project is created at the top level of the org. | `string` | `""` | no |
| <a name="input_prefix_id"></a> [prefix\_id](#input\_prefix\_id) | 4 chars prefix to uniquely identify Colt | `string` | n/a | yes |
| <a name="input_project_id_override"></a> [project\_id\_override](#input\_project\_id\_override) | If you don't want to use the automatically generated project ID, specify an ID here, note: Project IDs must be globally unique | `string` | `""` | no |
| <a name="input_services"></a> [services](#input\_services) | The list of APIs to activate within the project: https://cloud.google.com/service-usage/docs/enabled-service | `list(string)` | <pre>[<br>  "iam.googleapis.com",<br>  "iap.googleapis.com",<br>  "accesscontextmanager.googleapis.com",<br>  "cloudbilling.googleapis.com",<br>  "billingbudgets.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "serviceusage.googleapis.com",<br>  "compute.googleapis.com",<br>  "oslogin.googleapis.com",<br>  "container.googleapis.com",<br>  "containerscanning.googleapis.com",<br>  "appengine.googleapis.com",<br>  "run.googleapis.com",<br>  "storage-api.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "pubsub.googleapis.com",<br>  "cloudbuild.googleapis.com",<br>  "cloudkms.googleapis.com",<br>  "logging.googleapis.com",<br>  "monitoring.googleapis.com"<br>]</pre> | no |
| <a name="input_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#input\_shared\_vpc\_subnets) | List of subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) | `list(string)` | `[]` | no |
| <a name="input_svpc_host_project_id"></a> [svpc\_host\_project\_id](#input\_svpc\_host\_project\_id) | The ID of the host project which hosts the shared VPC. If NOT empty string, then this project will become a Service project. | `string` | `""` | no |
| <a name="input_vpc_service_control_attach_enabled"></a> [vpc\_service\_control\_attach\_enabled](#input\_vpc\_service\_control\_attach\_enabled) | Whether the project will be attached to a VPC Service Control Perimeter | `bool` | `false` | no |
| <a name="input_vpc_service_control_perimeter_name"></a> [vpc\_service\_control\_perimeter\_name](#input\_vpc\_service\_control\_perimeter\_name) | The name of a VPC Service Control Perimeter to add the created project to | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_labels"></a> [labels](#output\_labels) | All outputs from labels module |
| <a name="output_project"></a> [project](#output\_project) | Project outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
