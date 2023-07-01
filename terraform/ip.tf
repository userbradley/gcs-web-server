resource "google_compute_global_address" "ip" {
  name     = local.deployment_name
  project  = var.gke_project
  provider = google-beta
  labels = {
    environment = var.env
    system      = "gke"
    deployment  = var.deployment_name
    namespace   = var.deployment_name
  }
}