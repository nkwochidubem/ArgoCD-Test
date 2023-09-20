{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}


{{- define "clusterNodes" }}
- ip: "10.91.7.241"
  hostnames:
  - "k1.unified-portal-automation"
- ip: "10.91.7.242"
  hostnames:
  - "k2.unified-portal-automation"
- ip: "10.91.7.243"
  hostnames:
  - "k3.unified-portal-automation"
{{- end }}

{{- define "nonClusterNodes" }}
- ip: "10.91.7.253"
  hostnames:
  - "db2"
- ip: "10.91.7.252"
  hostnames:
  - "std-db01"  
{{- end }}

{{- define "hostaliases" }}
hostAliases:
{{- template "clusterNodes" . }}
{{- template "nonClusterNodes" . }}
{{- end }}