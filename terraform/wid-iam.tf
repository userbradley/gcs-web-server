resource "google_project_iam_member" "roles-dev" {
  project = var.service_project
  role    = "roles/iam.workloadIdentityUser"
  member  = google_service_account.service_account.member
}

resource "google_project_iam_member" "workload_identity-role-dev" {
  project = var.service_project
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${var.gke_project}.svc.id.goog[${var.namespace}/${var.deployment_name}]"
}
