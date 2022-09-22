module "labels" {
  source = "../..//modules/labels"

  prefix_id   = var.prefix_id
  email       = var.labels.email
  costid      = var.labels.costid
  live        = var.labels.live
  environment = var.labels.environment
  servicename = var.labels.servicename
}

module "region1_router1" {
  source = "../../modules/router"

  project_id   = var.project_id
  region       = var.region1
  network_name = var.network_name

  router_name             = "${module.labels.resource_name}-${var.region1}-router1"
  router_asn              = 16550
  router_advertise_config = var.router_advertise_config
}

module "region1_router2" {
  source = "../../modules/router"

  project_id   = var.project_id
  region       = var.region1
  network_name = var.network_name

  router_name             = "${module.labels.resource_name}-${var.region1}-router2"
  router_asn              = 16550
  router_advertise_config = var.router_advertise_config
}

module "region2_router1" {
  source = "../../modules/router"

  project_id   = var.project_id
  region       = var.region2
  network_name = var.network_name

  router_name             = "${module.labels.resource_name}-${var.region2}-router1"
  router_asn              = 16550
  router_advertise_config = var.router_advertise_config
}

module "region2_router2" {
  source = "../../modules/router"

  project_id   = var.project_id
  region       = var.region2
  network_name = var.network_name

  router_name             = "${module.labels.resource_name}-${var.region2}-router2"
  router_asn              = 16550
  router_advertise_config = var.router_advertise_config

}

module "interconnect" {
  source = "../..//modules/partner_interconnect"

  project_id = var.project_id

  ia_name_prefix = module.labels.resource_name

  region1              = var.region1
  region2              = var.region2
  region1_router1_name = module.region1_router1.router_info[0].name
  region1_router2_name = module.region1_router2.router_info[0].name
  region2_router1_name = module.region2_router1.router_info[0].name
  region2_router2_name = module.region2_router2.router_info[0].name

  activate = var.activate

}
