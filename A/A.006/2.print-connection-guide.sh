#!/usr/bin/env bash

CONTAINER_ID=''
NODE_NAME=''

if [ "$1" == "grafana" ]; then
    echo "create connect guide root user into grafana."
    CONTAINER_ID=$(kubectl get po -n monitoring $2 -o jsonpath="{.status.containerStatuses[].containerID}" | sed 's/.*\/\///')
    NODE_NAME=$(kubectl get po -n monitoring $2 -o jsonpath="{.spec.nodeName}")
elif [ "$1" == "prometheus-stack" ]; then
    echo "create connect guide root user into prometheus-stack-grafana."
    CONTAINER_ID=$(kubectl get po -n monitoring $2 -o jsonpath="{.status.containerStatuses[].containerID}" | sed 's/.*\/\///')
    NODE_NAME=$(kubectl get po -n monitoring $2 -o jsonpath="{.spec.nodeName}")
fi

echo "
Navigate to the $NODE_NAME node using SuperPutty, and then connect to the Grafana container with the command below.
runc --root /run/containerd/runc/k8s.io/ exec -t -u 0 $CONTAINER_ID bash
"
