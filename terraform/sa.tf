resource "google_service_account" "service_account" {
  project      = var.service_project
  account_id   = local.deployment_name
  description  = "${upper(var.env)}: Service account used for ${var.deployment_name}"
  display_name = "${local.deployment_name} Workload ID Service account"
}
