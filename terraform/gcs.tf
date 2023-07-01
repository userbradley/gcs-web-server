resource "google_storage_bucket" "bucket" {
  location                    = var.region
  name                        = local.deployment_name
  project                     = var.service_project
  uniform_bucket_level_access = true
}
