terraform {
  required_version = ">= 1.5.2"
  required_providers {
    google-beta = {
      source = "hashicorp/google-beta"
      version = ">= 4.71.0"
    }
    google = {
      source = "hashicorp/google"
      version = ">= 4.71.0"
    }
  }
}
