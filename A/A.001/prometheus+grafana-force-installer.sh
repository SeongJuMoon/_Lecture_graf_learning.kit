#!/usr/bin/env bash

helm uninstall -n monitoring prometheus > /dev/null 2>&1
helm uninstall -n monitoring grafana > /dev/null 2>&1
helm uninstall -n monitoring prometheus-stack > /dev/null 2>&1
kubectl -n monitoring delete pvc prometheus-prometheus-stack-kube-prom-prometheus-db-prometheus-prometheus-stack-kube-prom-prometheus-0 > /dev/null 2>&1
echo "waiting for deleting prometheus componentes in 5seconds"; sleep 5
echo "Delete all prometheus components successfully!"
echo "----------------------------------------------"

echo "Start to deploy native prometheus with scraping 15s interval"
echo "============================================================"
sh ~/_Lecture_graf_learning.kit/ch2/2.2/1.prometheus-installer-15s.sh

echo "Start to deploy grafana"
echo "============================================================"
sh ~/_Lecture_graf_learning.kit/ch2/2.2/2.grafana-installer.sh
