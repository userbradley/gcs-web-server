# We have to do the really hacky solution of doing a `join` on the output, or when you consume in in the module
# the output is numbered and sucks.


output "iap_client_secret" {
  value       = join("", google_iap_client.iap_client[*].secret)
  description = "IAP Client secret"
  sensitive   = true
}

output "iap_client_id" {
  value       = join("",google_iap_client.iap_client[*].client_id)
  description = "IAP Client ID"
}

output "gcp_secret_iap_client_secret" {
  value       = join("", google_secret_manager_secret.iap_client_secret[*].secret_id)
  description = "Name of the Secret created with the IAP Secret"
}

output "gcp_secret_iap_client_id" {
  value       = join("",google_secret_manager_secret.iap_client_id[*].secret_id)
  description = "Name of the Secret created with the IAP Client ID"
}
