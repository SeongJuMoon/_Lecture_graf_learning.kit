#!/usr/bin/env bash

helm install grafana edu/grafana \
--set image.grafana.tag="9.2.4" \
--set service.type="LoadBalancer" \
--set service.loadBalancerIP="192.168.1.12" \
--set persistence.enabled="true" \
--set adminPassword="admin" \
--set securityContext.runAsUser=65534 \
--set securityContext.runAsGroup=65534 \
--set securityContext.fsGroup=65534 \
--set "grafana\.ini"."auth\.anonymous".enabled="true" \
--set "grafana\.ini"."auth\.anonymous".org_name="Main Org." \
--set "grafana\.ini"."auth\.anonymous".org_role="Admin" \
--namespace monitoring