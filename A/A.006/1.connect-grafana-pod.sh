#!/usr/bin/bash 

if [ "$1" == "grafana" ]; then
    echo "Connecting to grafana pod in grafana container."
    kubectl exec -it deployments/grafana -n monitoring -c grafana -- bash
elif [ "$1" == "prometheus-stack" ]; then
    echo "Connecting to prometheus-stack-grafana pod in grafana container."
    kubectl exec -it deployments/prometheus-stack-grafana -n monitoring -c grafana -- bash
fi
