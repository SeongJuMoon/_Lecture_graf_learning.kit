#!/usr/bin/env bash
# scrape default is 30s for kube-prometheus-stack

helm install prometheus-stack edu/kube-prometheus-stack \
--set defaultRules.create="false" \
--set alertmanager.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set grafana.adminPassword="admin" \
--set grafana.image.tag="9.2.4" \
--set grafana.service.type="LoadBalancer" \
--set grafana.persistence.enabled="true" \
--set grafana.defaultDashboardsEnabled="false" \
--set grafana.sidecar.datasources.enabled="false" \
--set grafana."grafana\.ini"."auth\.anonymous".enabled="true" \
--set grafana."grafana\.ini"."auth\.anonymous".org_name="Main Org." \
--set grafana."grafana\.ini"."auth\.anonymous".org_role="Admin" \
--namespace=monitoring \
--create-namespace \
-f ~/_Lecture_graf_learning.kit/ch6/6.2/prom-operator-config/prom-operator-config-merged.yaml
