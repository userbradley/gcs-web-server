resource "google_iap_client" "iap_client" {
  count        = var.iap_enabled ? 1 : 0
  display_name = local.deployment_name
  brand        = local.iap_brand_name
}
