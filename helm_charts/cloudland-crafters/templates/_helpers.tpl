{{/*
Expand the name of the chart.
*/}}
{{- define "cloudland-crafters.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cloudland-crafters.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cloudland-crafters.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cloudland-crafters.labels" -}}
helm.sh/chart: {{ include "cloudland-crafters.chart" . }}
{{ include "cloudland-crafters.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cloudland-crafters.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cloudland-crafters.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cloudland-crafters.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cloudland-crafters.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
master labels
*/}}
{{- define "cloudland-crafters.master.labels" -}}
helm.sh/chart: {{ include "cloudland-crafters.chart" . }}
{{ include "cloudland-crafters.master.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
master labels
*/}}
{{- define "cloudland-crafters.master.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cloudland-crafters.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

server labels
*/}}
{{- define "cloudland-crafters.server.labels" -}}
helm.sh/chart: {{ include "cloudland-crafters.chart" . }}
{{ include "cloudland-crafters.server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
server labels
*/}}
{{- define "cloudland-crafters.server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cloudland-crafters.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}