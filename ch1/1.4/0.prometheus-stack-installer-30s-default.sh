#!/usr/bin/env bash
# scrape default is 30s for kube-prometheus-stack

helm install prometheus-stack edu/kube-prometheus-stack \
--set defaultRules.create="false" \
--set alertmanager.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--namespace=monitoring \
--create-namespace \
-f ~/_Lecture_graf_learning.kit/ch1/1.4/prom-operator-config/prom-operator-config-merged.yaml
