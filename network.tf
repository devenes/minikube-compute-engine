# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "minikube" {
  project                         = var.project_id
  name                            = "minikube-network"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = true
  mtu                             = 1460
  delete_default_routes_on_create = false
}
