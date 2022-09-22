module "peering" {
  source                     = "github.com/terraform-google-modules/terraform-google-network//modules/network-peering?ref=v3.4.0"
  local_network              = var.local_network
  peer_network               = var.peer_network
  export_local_custom_routes = var.export_local_custom_routes
  export_peer_custom_routes  = var.export_peer_custom_routes
}
