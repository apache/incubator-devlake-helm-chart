#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

{{/*
Expand the name of the chart.
*/}}
{{- define "devlake.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "devlake.fullname" -}}
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
{{- define "devlake.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "devlake.labels" -}}
helm.sh/chart: {{ include "devlake.chart" . }}
{{ include "devlake.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "devlake.selectorLabels" -}}
app.kubernetes.io/name: {{ include "devlake.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "devlake.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "devlake.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
The ui endpoint prefix
*/}}
{{- define "devlake.grafanaEndpointPrefix" -}}
{{- print .Values.ingress.prefix  "/grafana" | replace "//" "/" | trimAll "/" -}}
{{- end }}

{{/*
The ui endpoint prefix
*/}}
{{- define "devlake.uiEndpointPrefix" -}}
{{- print .Values.ingress.prefix  "/" | replace "//" "/" | trimAll "/" -}}
{{- end }}

{{/*
The ui endpoint
*/}}
{{- define "devlake.uiEndpoint" -}}
{{- if .Values.ingress.enabled }}
{{- $uiPortString := "" }}
{{- if .Values.ingress.enableHttps }}
{{- if ne 443 ( .Values.ingress.httpsPort | int) }}
{{- $uiPortString = printf ":%d" ( .Values.ingress.httpsPort | int) }}
{{- end }}
{{- printf "https://%s%s/%s" .Values.ingress.hostname $uiPortString (include "devlake.uiEndpointPrefix" .) }}
{{- else }}
{{- if ne 80 ( .Values.ingress.httpPort | int) }}
{{- $uiPortString = printf ":%d" ( .Values.ingress.httpPort | int) }}
{{- end }}
{{- printf "http://%s%s/%s" .Values.ingress.hostname $uiPortString (include "devlake.uiEndpointPrefix" .) }}
{{- end }}
{{- end }}
{{- end }}
