# Troubleshooting


<!-- TOC -->
* [Troubleshooting](#troubleshooting)
  * [Pod won't start](#pod-wont-start)
  * [404 errors, or objects not found](#404-errors-or-objects-not-found)
  * [Page loads blank](#page-loads-blank)
    * [How to check](#how-to-check)
      * [How to fix this](#how-to-fix-this)
        * [GitHub Actions](#github-actions)
  * [Open an issue](#open-an-issue)
<!-- TOC -->

If you have issues, see if they are on here before opening an issue


A good port of call for any whack issues, is to check the GCS Fuse documentation.

Useful pages are below

* [Playbook for Production issues](https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/playbook.md)
* [Mounting](https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/mounting.md)
* [Semantics](https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/semantics.md)
* [GCS Fuse Issues](https://github.com/GoogleCloudPlatform/gcsfuse/issues?q=is%3Aissue)

## Pod won't start

If you are using a `VPC Native` cluster, and don't have `nat` set up, you won't be able to pull the image.

Consider copying the image to Google Artifact Registry [using GCrane](https://documentation.breadnet.co.uk/kb/docker/copy-containers-between-repos)

I plan to set up a `Google Artifact Registry` for images at some point.

## 404 errors, or objects not found

Use `gcsfuse` in a session on the pod and mount it to temp with debug, and try open a file. 

```shell
gcsfuse --foreground --debug_fuse --debug_fs --debug_gcs --debug_http  --implicit-dirs -o allow_other gcs-website /tmp/dir
```

Then navigate to `/tmp/dir` in another session and try open a file.

## Page loads blank

Ensure that objects copied to the bucket aren't being `gzipped` on the way.

### How to check

Navigate to the GCS bucket where the pages are stored.

Click on the 3 dots on the far right hand side.

Click `Edit Metadata`

If you see `Content-Encoding` set to anything but blank (See example below) - Then it won't load.

![Content Encoding](assets/content-encoding.png)

#### How to fix this

##### GitHub Actions

```yaml
      - name: Upload Files
        id: 'upload-folder'
        uses: 'google-github-actions/upload-cloud-storage@v1'
        with:
          path: 'site'
          destination: 'gcs-website'
          parent: false
          gzip: false
```


## Open an issue

If the issue you're facing is not on here, please open an issue

[Link to open an issue](https://github.com/userbradley/gcs-web-server/issues/new)