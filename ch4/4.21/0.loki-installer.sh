#!/usr/bin/env bash

helm install loki-stack edu/loki-stack \
--set grafana.enabled=false \
--namespace monitoring 