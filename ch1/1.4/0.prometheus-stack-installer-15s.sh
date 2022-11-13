#!/usr/bin/env bash

helm install prometheus-stack edu/kube-prometheus-stack  \
--set defaultRules.create="false" \
--set alertmanager.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set prometheus.prometheusSpec.scrapeInterval="15s" \
--set prometheus.prometheusSpec.evaluationInterval="15s" \
--namespace=monitoring \
--create-namespace \
-f ~/_Lecture_graf_learning.kit/ch1/1.4/prom-operator-config/prom-operator-config-merged.yaml
