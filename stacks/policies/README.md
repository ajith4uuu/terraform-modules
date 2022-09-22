# Policies

> A stack to apply Google policies, which can be applied at organization, folder
or project level.

## Further reading

- [List of policies supported by
  GCP](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints)

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
| <a name="module_cloud_identity_domain_policy"></a> [cloud\_identity\_domain\_policy](#module\_cloud\_identity\_domain\_policy) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |
| <a name="module_oslogin_policy"></a> [oslogin\_policy](#module\_oslogin\_policy) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |
| <a name="module_resource_locations_policy"></a> [resource\_locations\_policy](#module\_resource\_locations\_policy) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |
| <a name="module_skip_default_network_policy"></a> [skip\_default\_network\_policy](#module\_skip\_default\_network\_policy) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |
| <a name="module_svc_acc_grants_policy"></a> [svc\_acc\_grants\_policy](#module\_svc\_acc\_grants\_policy) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |
| <a name="module_svc_disable_sa_key_creation"></a> [svc\_disable\_sa\_key\_creation](#module\_svc\_disable\_sa\_key\_creation) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |
| <a name="module_uniform_bucket_policy"></a> [uniform\_bucket\_policy](#module\_uniform\_bucket\_policy) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |
| <a name="module_vm_external_ip_policy"></a> [vm\_external\_ip\_policy](#module\_vm\_external\_ip\_policy) | github.com/terraform-google-modules/terraform-google-org-policy | v5.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder id to apply policies to | `string` | `null` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization id to apply policies to | `string` | `null` | no |
| <a name="input_policy_allowed_domain_ids"></a> [policy\_allowed\_domain\_ids](#input\_policy\_allowed\_domain\_ids) | (Only for list constraints) List of cloud identity domain ids allowed access | `list(string)` | n/a | yes |
| <a name="input_policy_for"></a> [policy\_for](#input\_policy\_for) | Resource hierarchy node to apply the policy to: can be one of organization, folder, or project | `string` | n/a | yes |
| <a name="input_policy_require_oslogin"></a> [policy\_require\_oslogin](#input\_policy\_require\_oslogin) | Sets the enforcement of OSLogin on compute if true | `bool` | `true` | no |
| <a name="input_policy_resource_locations"></a> [policy\_resource\_locations](#input\_policy\_resource\_locations) | (Only for list constraints) List of locations to allow resource creation | `list(string)` | `[]` | no |
| <a name="input_policy_skip_default_network"></a> [policy\_skip\_default\_network](#input\_policy\_skip\_default\_network) | Sets skip default network policy creation on projects if true | `bool` | `true` | no |
| <a name="input_policy_svc_acc_grants"></a> [policy\_svc\_acc\_grants](#input\_policy\_svc\_acc\_grants) | The default service account is created without any IAM permissions. | `bool` | `true` | no |
| <a name="input_policy_svc_acc_key_creation"></a> [policy\_svc\_acc\_key\_creation](#input\_policy\_svc\_acc\_key\_creation) | Disables the feature that allows creating public key to service account if true | `bool` | `true` | no |
| <a name="input_policy_uniform_bucket"></a> [policy\_uniform\_bucket](#input\_policy\_uniform\_bucket) | Sets uniform level access to buckets if true | `bool` | `true` | no |
| <a name="input_policy_vm_external_ip"></a> [policy\_vm\_external\_ip](#input\_policy\_vm\_external\_ip) | Allow or deny for the VMs to have external IP. Default is to deny | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project id to apply policies to | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
