# Labels

This module provides a consistent set of `labels` that can be applied to GCP
resources for billing purposes. It also provides resource names backed by a
naming convention to keep your GCP resource names consistent.

## Module outputs

This module provides:

- A map of labels to use on GCP resources:

```hcl
  transformed_labels = {
  "costid"      = "34273"
  "email"       = "platform@colt.net"
  "live"        = "no"
  "iac"         = "automatic"
  "environment" = "dev"
  "servicename" = "myservice"
}
```

- Standardised resource names based on your inputs:

```hcl
resource_name = gclt-dev-myservice
random_resource_name = gclt-dev-myservice-45d1
underscore_resource_name = gclt_dev_myservice
underscore_random_resource_name = gclt_dev_myservice_45d1
```

## GCP Label restrictions

GCP labels have many restrictions on which characters you can use. More
information can be found
[here](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements)

### Both label keys and values

- Maximum of 64 characters
- Allowed
  - lowercase
  - numeric
  - underscores
  - hyphens/dashes
  - international characters e.g. ç, é, ý, ú, í, ó, á
- Not allowed
  - Any other special character e.g. @, ., /, or a space

### Label values only

- No uppercase characters
- Can be empty

### Label keys only

- Keys must start with a lowercase letter
- Keys must be unique within a set of labels for a resource

### Label transformation

- Due to the restrictions that apply to GCP `labels`, this module will transform
  all inputs (e.g. making them lowercase, removing characters that are not
  allowed)

- `Email` will go through a bespoke transformation (substituting restricted
  special characters for international characters).
  - For example, `email = platform.support@colt.net` will be transformed
    into `email = platformøsupportλcoltønet`

- This is to ensure that labels are compliant before they are applied to a GCP
  resource.

## Naming convention

This module will output a resource name based on your inputs using the following
naming convention:

```hcl
gclt-{environment}-{servicename}[-{subservicename}]
gclt_{environment}_{servicename}[_{subservicename}]
```

Note:

- `gclt` = 4 chars prefix to uniquely identify Colt
- `-{subservicename}` and `_{subservicename}` are optional
- The naming convention was inspired by some sensible advice outlined
  [here](https://stepan.wtf/cloud-naming-convention/)

Examples:

```hcl
gclt-prd-ordering
gclt-prd-ordering-frontend
gclt-prd-ordering-21a6
```

## Example

### Input

```hcl
module "labels" {
  source      = "./labels"

  email       = "platform.support@colt.net"
  costid      = "34273"
  live        = "YES"
  iac         = "automatic"
  environment = "dev"
  servicename = " myservice"
}
```

### Output

```hcl
transformed_labels = {
  "email"       = "platformøsupportλcoltønet"
  "costid"      = "34273"
  "live"        = "yes"
  "iac"         = "automatic"
  "environment" = "dev"
  "servicename" = "myservice"
}

resource_name = gclt-dev-myservice
random_resource_name = gclt-dev-myservice-21a6
underscore_resource_name = gclt_dev_myservice
underscore_random_resource_name = gclt_dev_myservice_21a6
```

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.8 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_id.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_costid"></a> [costid](#input\_costid) | Optional, ID of the cost assigned to this GCP resource/project e.g. 419725 | `string` | `""` | no |
| <a name="input_email"></a> [email](#input\_email) | Optional, contact email for this GCP resource/project e.g. platform.support@colt.net | `string` | `""` | no |
| <a name="input_email_at_character"></a> [email\_at\_character](#input\_email\_at\_character) | Character used to transform any @ (at sign) in the email label | `map(any)` | <pre>{<br>  "original": "@",<br>  "transformed": "λ"<br>}</pre> | no |
| <a name="input_email_dot_character"></a> [email\_dot\_character](#input\_email\_dot\_character) | Character used to transform any . (dots) in the email label | `map(any)` | <pre>{<br>  "original": ".",<br>  "transformed": "ø"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Short environment name e.g. dev, prd, sbx | `string` | n/a | yes |
| <a name="input_live"></a> [live](#input\_live) | Is this service live? Either yes OR no | `string` | n/a | yes |
| <a name="input_prefix_id"></a> [prefix\_id](#input\_prefix\_id) | 4 chars prefix to uniquely identify Colt | `string` | n/a | yes |
| <a name="input_servicename"></a> [servicename](#input\_servicename) | Provide your service name e.g. purchase, ordering | `string` | n/a | yes |
| <a name="input_subservicename"></a> [subservicename](#input\_subservicename) | Optional, additional identifier for a service e.g. frontend will form {servicename}-frontend | `string` | `""` | no |
| <a name="input_transformation_regex"></a> [transformation\_regex](#input\_transformation\_regex) | Regex used to transform labels<br>  Has two keys:<br>  not\_allowed = is the regex to determine which characters should be removed, defaults to allow only lowercase, numeric, underscores, and hyphens<br>  replacement = is the character you want to replace removed characters with, defaults to empty (i.e. just remove the not allowed characters) | `map(any)` | <pre>{<br>  "not_allowed": "/[^a-z0-9-_]/",<br>  "replacement": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_random_resource_name"></a> [random\_resource\_name](#output\_random\_resource\_name) | Standardised resource name with a random suffix to facilitate uniqueness |
| <a name="output_raw_labels"></a> [raw\_labels](#output\_raw\_labels) | Map of labels with no transformation |
| <a name="output_resource_name"></a> [resource\_name](#output\_resource\_name) | Standardised resource name |
| <a name="output_transformed_labels"></a> [transformed\_labels](#output\_transformed\_labels) | Map of transformed labels adhering to GCP restrictions |
| <a name="output_underscore_random_resource_name"></a> [underscore\_random\_resource\_name](#output\_underscore\_random\_resource\_name) | Standardised resource name with a random suffix to facilitate uniqueness and underscore delimiter |
| <a name="output_underscore_resource_name"></a> [underscore\_resource\_name](#output\_underscore\_resource\_name) | Standardised resource name with underscore delimiter |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
