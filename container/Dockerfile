FROM golang:1.20.7-alpine3.18 AS gcsfuse
RUN apk add --no-cache git
ENV GOPATH="/go"
ENV GO111MODULE="auto"
RUN go install github.com/googlecloudplatform/gcsfuse@v1.0.0

FROM nginx:stable-alpine3.17-slim

LABEL maintainer="bradley@breadnet.co.uk"
LABEL description="gcs-web-server"
LABEL vcs-url="https://github.com/userbradley/gcs-web-server"

LABEL org.opencontainers.image.source="https://github.com/userbradley/gcs-web-server"
LABEL org.opencontainers.image.description="Container that allows you to mount a GCS Bucket and serve it via nginx"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.base.name="index.docker.io/nginx:stable-alpine3.17-slim"

COPY --from=gcsfuse /go/bin/gcsfuse /usr/local/bin

RUN apk add --no-cache ca-certificates fuse

RUN mkdir -p /var/www/site

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY real-ip-config.conf /etc/nginx/real-ip-config.conf
COPY real-ip-ranges.conf /etc/nginx/real-ip-ranges.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
