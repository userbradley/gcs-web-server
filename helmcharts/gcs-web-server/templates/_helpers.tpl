{{/*
Expand the name of the chart.
*/}}
{{- define "gcs-web-server.name" -}}
{{- .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "gcs-web-server.labels" -}}
{{ include "gcs-web-server.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "gcs-web-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gcs-web-server.name" . }}
app.kubernetes.io/tier: webserver
{{- end }}


{{- define "IpAddress.name" -}}
{{- printf "%s-%s" .Values.ingress.ipName .Values.env }}
{{- end}}

{{- define "bucket.name" -}}
{{- printf "%s-%s" .Values.googleCloud.bucketName .Values.env }}
{{- end}}


{{- define "serviceAccount.email"}}
{{- printf "%s-%s@%s.iam.gserviceaccount.com" .Values.googleCloud.serviceAccount .Values.env .Values.googleCloud.project }}
{{- end}}


{{/*Ingress domain*/}}

{{- define "ingress.domain" -}}

{{- if eq .Values.env "dev" }}
{{- printf "%s.%s" .Values.env .Values.ingress.domain }}
{{- end }}

{{- if eq .Values.env "test" }}
{{- printf "%s.%s" .Values.env .Values.ingress.domain }}
{{- end }}

{{- if eq .Values.env "prd"  }}
{{- printf "%s" .Values.ingress.domain }}
{{- end }}

{{- end }}