resource "google_storage_bucket" "gcs-website" {
  name                        = "gcs-website"
  location                    = var.location
  project                     = var.project
  uniform_bucket_level_access = true
}
