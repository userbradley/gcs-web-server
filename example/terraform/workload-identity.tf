resource "google_project_iam_member" "wid-usere" {
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${google_service_account.gcs-website.email}"
  project = var.project
}

resource "google_project_iam_member" "workload_identity-role" {
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${var.project}.svc.id.goog[${var.namespace}/${var.ksa}]"
  project = var.project
}
