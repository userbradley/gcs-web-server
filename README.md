# GCS Web Server Helm Chart repository

This is the helm repo for [gcs-web-server](https://github.com/userbradley/gcs-web-server) - A simple application for hosting static sites behind IAP on GKE

Or maybe not behind IAP, up to you!

```shell
helm repo add gcs-web-server https://gcs-web-server.breadnet.co.uk
helm repo search gcs-web-server
```

To get the values file

```shell
helm show values gcs-web-server/gcs-web-server > values.yaml
```

## Issues?

If you have an issue, [Please open a new one for me](https://github.com/userbradley/gcs-web-server/issues/new)
