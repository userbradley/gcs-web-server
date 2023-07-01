variable "gke_project" {
  type        = string
  description = "Name of the GCP project"
}

variable "secret_project" {
  type        = string
  description = "Name of the Secrets project to use"
}

variable "service_project" {
  type        = string
  description = "Name of the service project"
}

variable "deployment_name" {
  type        = string
  description = "Name of the deployment"
}

variable "env" {
  type        = string
  description = "Name of the Environment"
}

variable "region" {
  type        = string
  description = "Name of the Region to deploy the resources in to"
  default     = "europe-west2"
}

variable "iap_enabled" {
  type        = bool
  description = "Should IAP Credentials be generated"
}


variable "namespace" {
  type        = string
  description = "Name of the GKE Namespace this will be deployed in to"
}

