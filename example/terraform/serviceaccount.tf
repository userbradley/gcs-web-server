resource "google_service_account" "gcs-website" {
  display_name = "WID GCS Webserver"
  account_id   = "wid-gcs-website"
  description  = "Service account used in GKE for gcs-webserver"
  project      = var.project
}