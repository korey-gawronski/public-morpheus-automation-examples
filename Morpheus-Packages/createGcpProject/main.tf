resource "random_id" "random" {
  byte_length = 2
}

# Create Project, Link Billing, Add Labels
resource "google_project" "new_project" {
  name = var.project_name
  # Example project_id:  project_id = projectname-12345
  project_id      = "${trim(lower(var.project_id_prefix), " ")}-${random_id.random.dec}" # It must be unique to all customers of GCP
  folder_id       = var.folder_id
  billing_account = var.billing_account_id
}

# Enable APIs
resource "google_project_service" "services" {
  for_each = toset(var.service_list)
  project  = google_project.new_project.id
  service  = each.key

  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_compute_network" "vpc_network" {
  name                    = "default-network"
  auto_create_subnetworks = true
  project                 = google_project.new_project.project_id
  depends_on = [
    google_project_service.services
  ]
}