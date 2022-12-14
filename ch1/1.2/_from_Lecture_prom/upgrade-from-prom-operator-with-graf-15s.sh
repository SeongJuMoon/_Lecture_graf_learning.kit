#!/usr/bin/env bash

helm upgrade prometheus-stack edu/kube-prometheus-stack  \
--set defaultRules.create="false" \
--set alertmanager.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set prometheus.prometheusSpec.scrapeInterval="15s" \
--set prometheus.prometheusSpec.evaluationInterval="15s" \
--set grafana.adminPassword="admin" \
--set grafana.image.tag="9.2.4" \
--set grafana.service.type="LoadBalancer" \
--set grafana.persistence.enabled="true" \
--set grafana.defaultDashboardsEnabled="false" \
--namespace=monitoring \
-f ~/_Lecture_graf_learning.kit/ch1/1.2/_from_Lecture_prom/prom-operator-config-merged.yaml
