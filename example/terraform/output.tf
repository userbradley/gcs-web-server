output "gcs-wid-sa" {
  value     = google_service_account.gcs-website.email
  sensitive = false
}