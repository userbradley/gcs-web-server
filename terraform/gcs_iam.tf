resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.bucket.name
  member = google_service_account.service_account.member
  role   = "roles/storage.objectViewer"
}
