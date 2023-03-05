resource "google_storage_bucket_iam_member" "gcs-website" {
  bucket = google_storage_bucket.gcs-website.name
  member = "serviceAccount:${google_service_account.gcs-website.email}"
  role   = "roles/storage.objectViewer"
}
