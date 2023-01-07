#!/usr/bin/env bash

helm install prometheus-stack edu/kube-prometheus-stack  \
--set defaultRules.create="true" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set prometheus.prometheusSpec.scrapeInterval="15s" \
--set prometheus.prometheusSpec.evaluationInterval="15s" \
--set grafana.adminPassword="admin" \
--set grafana.image.tag="9.2.4" \
--set grafana.service.type="LoadBalancer" \
--set grafana.persistence.enabled="true" \
--namespace=monitoring \
--create-namespace \
-f ~/_Lecture_graf_learning.kit/ch9/9.2/prom-operator-config/prom-operator-config-merged.yaml
