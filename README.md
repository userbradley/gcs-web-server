# GCS Web server

<!-- TOC -->
* [GCS Web server](#gcs-web-server)
  * [Quick start](#quick-start)
  * [What you need pre-existing](#what-you-need-pre-existing)
    * [What if I don't want to use Workload Identity](#what-if-i-dont-want-to-use-workload-identity)
  * [Useful information](#useful-information)
    * [Where the content should go](#where-the-content-should-go)
    * [What health check endpoints exist?](#what-health-check-endpoints-exist)
    * [Custom 404 page](#custom-404-page)
    * [Custom 5xx errors](#custom-5xx-errors)
    * [What ports does the container listen on](#what-ports-does-the-container-listen-on)
    * [Where are the docker images](#where-are-the-docker-images)
    * [Building the image locally](#building-the-image-locally)
  * [Example manifest](#example-manifest)
<!-- TOC -->


This is a simple docker container that allows you to connect to a GCS bucket and serve webpages from it, in Kubernetes. 

## Quick start

See the [Quick Start](example/README.md) with supplied Terraform and Kubernetes Manifests 

## What you need pre-existing

* GKE Cluster
* Workload Identity Enabled
* Kubernetes Service account connected to GSA
* GCS Bucket

### What if I don't want to use Workload Identity

> **Warning**
> You should really consider using workload identity
> 
> [Learn more here](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity#:~:text=Workload%20Identity%20allows%20workloads%20in,to%20access%20Google%20Cloud%20services.)


[plutov/gcs-k8f-deployment-full.yml](https://gist.github.com/plutov/34d904edaa07d57bc0c1b84bc42114e4#file-gcs-k8f-deployment-full-yml)

## Useful information

### Where the content should go

Upload what ever static site you want in to the root of the bucket.

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

Currently, not supported. If this is required, please open an issue.

### What ports does the container listen on

| IP Stack version | IP address | Port |
|------------------|------------|------|
| `v6`             | `[::]`     | `80` |
| `v4`             | `0.0.0.0`  | `80` |

### Where are the docker images

* [userbradley/gcs-web-server](https://hub.docker.com/r/userbradley/gcs-web-server)
* _Google Artifact Registry coming soon! - Open an issue if this would benefit you!_

### Building the image locally

```shell
docker build -t gcs-web-server:latest .
```

## Example manifest

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gcs-website
spec:
  replicas: 2
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app.kubernetes.io/name: gcs-website
  template:
    metadata:
      labels:
        app.kubernetes.io/name: gcs-website
    spec:
      volumes:
        - name: gcs
          emptyDir: {}
      serviceAccountName: gcs-website
      containers:
        - name: gcs-website
          image: "userbradley/gcs-web-server"
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 80
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /healthz
              port: 80
            initialDelaySeconds: 10
            periodSeconds: 10
          securityContext:
            privileged: true
            capabilities:
              add:
                - SYS_ADMIN
          volumeMounts:
            - mountPath: /var/www/site
              name: gcs
          lifecycle:
            postStart:
              exec:
                command: [ "gcsfuse","--implicit-dirs", "-o", "allow_other", "gcs-bucket-name", "/var/www/site" ]
            preStop:
              exec:
                command: [ "fusermount", "-u", "/var/www/site/" ]
```