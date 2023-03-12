#!/usr/bin/env bash

helm uninstall -n monitoring prometheus 
helm uninstall -n monitoring grafana

