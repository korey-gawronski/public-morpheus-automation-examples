resource "google_compute_network" "vpc_network" {
  name = var.network_name
  auto_create_subnetworks = true
  project = var.project_id
}

resource "google_compute_network" "vpc_temp_network" {
  name = "temp-network"
  auto_create_subnetworks = true
  project = var.project_id
}