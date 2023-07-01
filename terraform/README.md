
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
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | IP address of the IP Address | `"198.51.100.69"` | no |
| <a name="output_ip_address_name"></a> [ip\_address\_name](#output\_ip\_address\_name) | Name of the IP Address | `"{deployment_name}-{env}"` | no |


---

# Testing

The testing suit is still being developed

# Module Owners

| Name             | Email                                                                                                                                                                                                             |
|------------------|-----------------------------------------------------------------|
| Bradley Stannard | [opensource@breadnet.co.uk](mailto:opensource@breadnet.co.uk?subject=gcs-web-server&body=Hi%20Bradley%2C%0D%0A%0D%0AI%20got%20your%20email%20address%20from%20the%20gcs-web-server%20repository%20on%20github.%0D%0A%0D%0A%3C!--%20Insert%20your%20email%20here%20--%3E%0D%0A%0D%0A%0D%0A%3C!--%20Dont%20forget%20to%20sign%20off%20with%20your%20name%20--%3E) |

---


## How to generate documentation

run `task docs`
