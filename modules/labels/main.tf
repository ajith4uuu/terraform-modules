# Supplied text for labels has to be transformed to meet GCP labels restrictions.
locals {

  transformed_labels = {
    email          = replace(replace(lower(var.email), var.email_dot_character.original, var.email_dot_character.transformed), var.email_at_character.original, var.email_at_character.transformed)
    costid         = replace(lower(var.costid), var.transformation_regex.not_allowed, var.transformation_regex.replacement)
    live           = replace(lower(var.live), var.transformation_regex.not_allowed, var.transformation_regex.replacement)
    iac            = "automatic"
    environment    = replace(lower(var.environment), var.transformation_regex.not_allowed, var.transformation_regex.replacement)
    servicename    = replace(lower(var.servicename), var.transformation_regex.not_allowed, var.transformation_regex.replacement)
    subservicename = replace(lower(var.subservicename), var.transformation_regex.not_allowed, var.transformation_regex.replacement)
  }

  # If empty don't include, otherwide prefix with hyphen
  subservicename_check = local.transformed_labels.subservicename == "" ? "" : "-${local.transformed_labels.subservicename}"
  # If empty don't include, otherwide prefix with underscore
  underscore_subservicename_check = local.transformed_labels.subservicename == "" ? "" : "_${local.transformed_labels.subservicename}"

  # gclt = 4 chars prefix to uniquely identify Colt
  # e.g. gclt-prd-purchase or gclt-prd-purchase-frontend
  resource_name = "${var.prefix_id}-${local.transformed_labels.environment}-${local.transformed_labels.servicename}${local.subservicename_check}"

  # e.g. gclt-prd-purchase-21a6
  random_resource_name = "${local.resource_name}-${random_id.random.hex}"

  # e.g. gclt_prd_purchase or gclt_prd_purchase_frontend
  underscore_resource_name = "${var.prefix_id}_${local.transformed_labels.environment}_${local.transformed_labels.servicename}${local.underscore_subservicename_check}"

  # e.g. gclt_prd_purchase_21a6
  underscore_random_resource_name = "${local.resource_name}_${random_id.random.hex}"
}

resource "random_id" "random" {
  byte_length = 2
}
