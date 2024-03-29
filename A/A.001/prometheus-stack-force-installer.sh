#!/usr/bin/env bash

helm uninstall -n monitoring prometheus > /dev/null 2>&1
helm uninstall -n monitoring grafana > /dev/null 2>&1
helm uninstall -n monitoring prometheus-stack > /dev/null 2>&1
kubectl -n monitoring delete pvc prometheus-prometheus-stack-kube-prom-prometheus-db-prometheus-prometheus-stack-kube-prom-prometheus-0 > /dev/null 2>&1
echo "Waiting for deleting prometheus componentes in 5 Seconds"; sleep 5
echo "Delete all prometheus components successfully!"
echo "----------------------------------------------"

echo "Start to deploy prometheus operator with scraping 15s interval"
echo "=============================================================="
sh ~/_Lecture_graf_learning.kit/ch9/9.6/1.prometheus-stack-installer-15s.sh
echo "--------------------------------------------------------------"
echo "Enable to scrape control-plane componentes"
sh ~/_Lecture_graf_learning.kit/ch9/9.6/2.enabled-control-plane-scrape.sh
echo "--------------------------------------------------------------"
