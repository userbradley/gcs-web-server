
# GCS Webserver Module


---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Name of the deployment | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Name of the Environment | `string` | n/a | yes |
| <a name="input_gke_project"></a> [gke\_project](#input\_gke\_project) | Name of the GCP project | `string` | n/a | yes |
| <a name="input_iap_enabled"></a> [iap\_enabled](#input\_iap\_enabled) | Should IAP Credentials be generated | `bool` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the GKE Namespace this will be deployed in to | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Name of the Region to deploy the resources in to | `string` | `"europe-west2"` | no |
| <a name="input_secret_project"></a> [secret\_project](#input\_secret\_project) | Name of the Secrets project to use | `string` | n/a | yes |
| <a name="input_service_project"></a> [service\_project](#input\_service\_project) | Name of the service project | `string` | n/a | yes |

## Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_gcp_secret_iap_client_id"></a> [gcp\_secret\_iap\_client\_id](#output\_gcp\_secret\_iap\_client\_id) | Name of the Secret created with the IAP Client ID | `"{env}-{deployment_name}-iap-client-id"` | no |
| <a name="output_gcp_secret_iap_client_secret"></a> [gcp\_secret\_iap\_client\_secret](#output\_gcp\_secret\_iap\_client\_secret) | Name of the Secret created with the IAP Secret | `"{env}-{deployment_name}-iap-client-secret"` | no |
| <a name="output_iap_client_id"></a> [iap\_client\_id](#output\_iap\_client\_id) | IAP Client ID | `"redacted.apps.googleusercontent.com"` | no |
| <a name="output_iap_client_secret"></a> [iap\_client\_secret](#output\_iap\_client\_secret) | IAP Client secret | `<sensitive>` | yes |


---

# Testing

Use the task file in the `test` directory to test the module

# Module Owners

| Name             | Email                                                                                                                                                                                                             |
|------------------|-----------------------------------------------------------------|
| Bradley Stannard | [bradley@breadnet.co.uk](mailto:bradley@breadnet.co.uk) |

---


## How to generate documentation

run `task docs`
