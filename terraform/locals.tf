locals {
  iap_brand_name  = "projects/${data.google_project.project.number}/brands/${data.google_project.project.number}"
  deployment_name = "${var.deployment_name}-${var.env}"
  secret_name     = "${var.env}-${var.deployment_name}"
}
