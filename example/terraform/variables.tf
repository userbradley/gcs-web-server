variable "project" {
  description = "Name of the project you wish to deploy the infrastructure to"
}
variable "namespace" {
  description = "Name of the Kubernetes Namespace the Kubernetes service account exists in"
  default     = "default"
}
variable "ksa" {
  description = "Name of the Kubernetes service account"
  default     = "gcs-website"
}
variable "location" {
  description = "Location that the GCS Bucket will exist in"
  default     = "europe-west2"
}
