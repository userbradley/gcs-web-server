# GCS Web server

> [!CAUTION]
> No longer maintained
> 
> This repo is no longer maintained on an active basis. I will however respond to issues and feature requests, but as far as I am concerned this repo is feature complete.

<!-- TOC -->
* [GCS Web server](#gcs-web-server)
  * [Quick start](#quick-start)
  * [What you need pre-existing](#what-you-need-pre-existing)
    * [GKE Cluster](#gke-cluster)
    * [GKE Project with Oauth Consent Screen](#gke-project-with-oauth-consent-screen)
    * [Service project](#service-project)
    * [Secrets project](#secrets-project)
  * [Useful information](#useful-information)
    * [Where the content should go](#where-the-content-should-go)
    * [What health check endpoints exist?](#what-health-check-endpoints-exist)
    * [Custom 404 page](#custom-404-page)
    * [Custom 5xx errors](#custom-5xx-errors)
    * [What ports does the container listen on](#what-ports-does-the-container-listen-on)
    * [Where is the docker image](#where-is-the-docker-image)
<!-- TOC -->


Opinionated infrastructure and supporting materials to host a website from a GCS Bucket on GKE

## Why?

GCP does not allow us to put IAP on a backend bucket, and I run several GKE clusters so this seems like a pretty simple solution



## Quick start

See the [Full example repository](https://github.com/userbradley/gcs-web-server-example) where minimal input is required from your self
to get up and running

Any issues, check the [Troubleshooting Page](troubleshooting.md)

## What is required

* Terraform installed locally
* Helm installed locally

## Terraform specifics

### What terraform resources are created

See the [Resources](terraform/README.md#resources) section

**Q:** Why are we creating a secret?

**A:** The secrets are created so that if you need to allow other team members to upgrade the helm chart, they are able to pull
the secrets from your central secret manager

### Helm specifics

You will need to create a DNS record pointing to the IP address created by the module.

**Q:** What values can I set in the helm chart?

**A:** see [helmcharts/gcs-web-server/values.yaml](helmcharts/gcs-web-server/values.yaml)



## What you need pre-existing

* GKE Cluster with Workload Identity enabled
* GKE Project with IAP Oauth Consent screen created
* _service project_ where the buckets and service accounts can be created
* Secrets project

These requirements will be explained in detail below

### GKE Cluster

See [Allow Pods to authenticate to Google CLoud APIs using Workload Identity](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity) on how to enable Workload Identity on your cluster

### GKE Project with Oauth Consent Screen

This is required for IAP

Navigate to [**APIs & Services** > **OAuth consent screen**](https://console.cloud.google.com/apis/credentials/consent)

### Service project

A service project is required to store the below items in

* Service accounts
* GCS Buckets
* Workload Identity Bindings

We do not create these in the GKE project, as it's best practice to keep a deployment per project.

You should create the project in the format of:

```shell
<company-name>-<name-of-site>
```

Do not prepend `{env}` to this, as the Module will create buckets and service accounts for all environments (if you chose to create multiple) in the same project


### Secrets project

A secrets project is required as the module creates secrets with the IAP oauth credentials (If enabled)

You can set this to any project that has the `secrets` api enabled


## Useful information about the container

### Where the content should go

Upload what ever static site you want in to the root of the bucket. It will render `html`, `css` and `javascript`

All pages will get rendered when you hit the link.

The server supports sub-pages, so if you are uploading everything in go `gs://gcs-webstite/site/index.html` - Your page will 
be available at `http://<>/site/index.html`

### What health check endpoints exist?

| Name of endpoint | Response code | Example response        |
|------------------|---------------|-------------------------|
| `/healthz`       | `http/200`    | `{"status":"UP"}`       |
| `/health`        | `http/200`    | `{"status":"UP"}`       |

> **Note**
> These endpoints do not generate logs, to save costs.

### Custom 404 page

To make use of your own custom 404 page, place a `404.html` file in the root of the bucket/ 

This page will be served for the below errors:

* [404](https://http.cat/404)
* [403](https://http.cat/403)

### Custom 5xx errors

Currently not supported. If this is required please open an issue.

### What ports does the container listen on

| IP Stack version | IP address | Port |
|------------------|------------|------|
| `v6`             | `[::]`     | `80` |
| `v4`             | `0.0.0.0`  | `80` |

### Where is the docker image

* [GitHub Container Registry](https://github.com/userbradley/gcs-web-server/pkgs/container/gcs-web-server)
* [Google Artifact Registry](https://console.cloud.google.com/artifacts/docker/breadnet-container-store/europe-west2/public/gcs-web-server)

## FAQ

### What CLI tools do I need installed

* Helm
* Terraform

Optionally: `skaffold`

###  Why do you create a secret

A secret is created by default (eg: you cant turn it off) so that if other members of the team need access to upgrade the helm chart,
they have the secrets locally.

[See how to print latest secret](https://documentation.breadnet.co.uk/cloud/gcp/print-secret-gcloud/)


### How do I create Multiple environments?

To create multiple environments, simply copy and paste the entire module, and change the `env` to one of `dev`, `test`, or `prod`

### Why only `dev` test and `prod`

Limitation in the helm chart that I have not fixed yet

[Open GitHub issue](https://github.com/userbradley/gcs-web-server/issues/6)

