module "gcs-web-server" {
  source = "../"

  deployment_name = var.deployment_name
  env             = var.env
  gke_project     = var.gke_project
  iap_enabled     = var.iap_enabled
  namespace       = var.namespace
  secret_project  = var.secret_project
  service_project = var.service_project
}

output "iap_client_secret" {
  value       = module.gcs-web-server.iap_client_secret
  description = "IAP Client secret"
  sensitive   = true
}

output "iap_client_id" {
  value       =  module.gcs-web-server.iap_client_id
  description = "IAP Client ID"
}

output "gcp_secret_iap_client_secret" {
  value       = module.gcs-web-server.gcp_secret_iap_client_secret
  description = "Name of the Secret created with the IAP Secret"
}

output "gcp_secret_iap_client_id" {
  value       = module.gcs-web-server.gcp_secret_iap_client_id
  description = "Name of the Secret created with the IAP Client ID"
}