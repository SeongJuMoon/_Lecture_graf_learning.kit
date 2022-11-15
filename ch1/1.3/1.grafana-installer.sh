#!/usr/bin/env bash

helm install grafana edu/grafana \
--set image.grafana.tag="9.2.4" \
--set service.type="LoadBalancer" \
--set persistence.enabled="true" \
--set adminPassword="admin"
