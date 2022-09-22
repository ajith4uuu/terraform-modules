# Logs: Audit

> A stack that creates log sinks and destinations for activity, system event,
data access, access transparency, and policy denied audit logs.

## Modules/Resources in this stack

- Heavy use of this module:
  <https://github.com/terraform-google-modules/terraform-google-log-export>
  which provides:
  - An aggregated log export on the project-level, folder-level,
    organization-level, or billing-account-level
  - A service account (logsink writer)
  - A destination (Cloud Storage buckets)
- The ability to set IAM permissions on the destination project level.
  - For example, to allow an InfoSec team read-only permissions to the
    aggregated logs
- Set expiry time
- Set of labels and resource names from the `labels` module

## Further reading

More information on the different types of audit logs:
<https://cloud.google.com/logging/docs/audit>

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.88.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.88.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.88.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_destination_bq_access_transparency_logs"></a> [destination\_bq\_access\_transparency\_logs](#module\_destination\_bq\_access\_transparency\_logs) | github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery | v7.2.0 |
| <a name="module_destination_bq_activity_logs"></a> [destination\_bq\_activity\_logs](#module\_destination\_bq\_activity\_logs) | github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery | v7.2.0 |
| <a name="module_destination_bq_data_access_logs"></a> [destination\_bq\_data\_access\_logs](#module\_destination\_bq\_data\_access\_logs) | github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery | v7.2.0 |
| <a name="module_destination_bq_policy_denied_logs"></a> [destination\_bq\_policy\_denied\_logs](#module\_destination\_bq\_policy\_denied\_logs) | github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery | v7.2.0 |
| <a name="module_destination_bq_system_event_logs"></a> [destination\_bq\_system\_event\_logs](#module\_destination\_bq\_system\_event\_logs) | github.com/terraform-google-modules/terraform-google-log-export//modules/bigquery | v7.2.0 |
| <a name="module_labels"></a> [labels](#module\_labels) | ../..//modules/labels | n/a |
| <a name="module_sink_bq_access_transparency_logs"></a> [sink\_bq\_access\_transparency\_logs](#module\_sink\_bq\_access\_transparency\_logs) | github.com/terraform-google-modules/terraform-google-log-export | v7.2.0 |
| <a name="module_sink_bq_activity_logs"></a> [sink\_bq\_activity\_logs](#module\_sink\_bq\_activity\_logs) | github.com/terraform-google-modules/terraform-google-log-export | v7.2.0 |
| <a name="module_sink_bq_data_access_logs"></a> [sink\_bq\_data\_access\_logs](#module\_sink\_bq\_data\_access\_logs) | github.com/terraform-google-modules/terraform-google-log-export | v7.2.0 |
| <a name="module_sink_bq_policy_denied_logs"></a> [sink\_bq\_policy\_denied\_logs](#module\_sink\_bq\_policy\_denied\_logs) | github.com/terraform-google-modules/terraform-google-log-export | v7.2.0 |
| <a name="module_sink_bq_system_event_logs"></a> [sink\_bq\_system\_event\_logs](#module\_sink\_bq\_system\_event\_logs) | github.com/terraform-google-modules/terraform-google-log-export | v7.2.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.bigquery_project_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bigquery_project_iam_permissions"></a> [bigquery\_project\_iam\_permissions](#input\_bigquery\_project\_iam\_permissions) | List of IAM permissions that neeed to be granted for users to be able to see the logs. | `list(string)` | <pre>[<br>  "roles/bigquery.dataViewer"<br>]</pre> | no |
| <a name="input_delete_contents_on_destroy"></a> [delete\_contents\_on\_destroy](#input\_delete\_contents\_on\_destroy) | If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. | `bool` | `false` | no |
| <a name="input_expiration_days"></a> [expiration\_days](#input\_expiration\_days) | Log expiration days. Default is 90 days. | `number` | `90` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels (i.e. tags) to add to project for billing purposes<br>  Required labels example:<br>  labels = {<br>    email       = "platform.support@colt.net"<br>    costid      = "34623"<br>    live        = "no"<br>    environment = "dev"<br>    servicename = "myservice"<br>  } | `map(string)` | n/a | yes |
| <a name="input_log_location"></a> [log\_location](#input\_log\_location) | The location of the logs. After setting the location it cannot be changed. | `string` | `"EU"` | no |
| <a name="input_log_project_member"></a> [log\_project\_member](#input\_log\_project\_member) | User/Group to be given permissions to the central logs project. eg. Security team | `string` | n/a | yes |
| <a name="input_prefix_id"></a> [prefix\_id](#input\_prefix\_id) | 4 chars prefix to uniquely identify Colt | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID for log destination | `string` | n/a | yes |
| <a name="input_sink_parent_resource_id"></a> [sink\_parent\_resource\_id](#input\_sink\_parent\_resource\_id) | The ID of the GCP resource in which you create the log sink, eg. if var.sink\_parent\_resource\_type is set to 'folder', then this is the Folder ID. | `string` | n/a | yes |
| <a name="input_sink_parent_resource_type"></a> [sink\_parent\_resource\_type](#input\_sink\_parent\_resource\_type) | The GCP resource in which you create the log sink. The value must not be computed, and must be one of the following: 'project', 'folder', 'billing\_account', or 'organization'. | `string` | `"folder"` | no |
| <a name="input_unique_writer_identity"></a> [unique\_writer\_identity](#input\_unique\_writer\_identity) | Whether or not to create a unique identity associated with this sink. If false (the default), then the writer\_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bigquery_project_permissions"></a> [bigquery\_project\_permissions](#output\_bigquery\_project\_permissions) | Permissions of the users/groups added to the destination project |
| <a name="output_destination_bq_access_transparency_logs"></a> [destination\_bq\_access\_transparency\_logs](#output\_destination\_bq\_access\_transparency\_logs) | All outputs from destination module |
| <a name="output_destination_bq_activity_logs"></a> [destination\_bq\_activity\_logs](#output\_destination\_bq\_activity\_logs) | All outputs from destination module |
| <a name="output_destination_bq_data_access_logs"></a> [destination\_bq\_data\_access\_logs](#output\_destination\_bq\_data\_access\_logs) | All outputs from destination module |
| <a name="output_destination_bq_policy_denied_logs"></a> [destination\_bq\_policy\_denied\_logs](#output\_destination\_bq\_policy\_denied\_logs) | All outputs from destination module |
| <a name="output_destination_bq_system_event_logs"></a> [destination\_bq\_system\_event\_logs](#output\_destination\_bq\_system\_event\_logs) | All outputs from destination module |
| <a name="output_labels"></a> [labels](#output\_labels) | All outputs from labels module |
| <a name="output_sink_bq_access_transparency_logs"></a> [sink\_bq\_access\_transparency\_logs](#output\_sink\_bq\_access\_transparency\_logs) | All outputs from sink module |
| <a name="output_sink_bq_activity_logs"></a> [sink\_bq\_activity\_logs](#output\_sink\_bq\_activity\_logs) | All outputs from sink module |
| <a name="output_sink_bq_data_access_logs"></a> [sink\_bq\_data\_access\_logs](#output\_sink\_bq\_data\_access\_logs) | All outputs from sink module |
| <a name="output_sink_bq_policy_denied_logs"></a> [sink\_bq\_policy\_denied\_logs](#output\_sink\_bq\_policy\_denied\_logs) | All outputs from sink module |
| <a name="output_sink_bq_system_event_logs"></a> [sink\_bq\_system\_event\_logs](#output\_sink\_bq\_system\_event\_logs) | All outputs from sink module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
