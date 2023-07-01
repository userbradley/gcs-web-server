resource "google_secret_manager_secret" "iap_client_id" {
  count     = var.iap_enabled ? 1 : 0
  secret_id = "${local.secret_name}-iap-client-id"
  project   = var.secret_project

  replication {
    user_managed {
      replicas {
        location = "europe-west2"
      }
    }
  }

  labels = {
    system    = var.deployment_name
    env       = var.env
    namespace = local.deployment_name
    type      = "iap-client-id"
  }
}

resource "google_secret_manager_secret_version" "iap_client_id" {
  count       = var.iap_enabled ? 1 : 0
  secret      = google_secret_manager_secret.iap_client_id.0.id
  secret_data = google_iap_client.iap_client.0.client_id
}


resource "google_secret_manager_secret" "iap_client_secret" {
  count     = var.iap_enabled ? 1 : 0
  secret_id = "${local.secret_name}-iap-client-secret"
  project   = var.secret_project

  replication {
    user_managed {
      replicas {
        location = "europe-west2"
      }
    }
  }

  labels = {
    system    = var.deployment_name
    env       = var.env
    namespace = local.deployment_name
    type      = "iap-client-secret"
  }
}

resource "google_secret_manager_secret_version" "iap_client_secret" {
  count       = var.iap_enabled ? 1 : 0
  secret      = google_secret_manager_secret.iap_client_secret.0.id
  secret_data = google_iap_client.iap_client.0.secret
}
