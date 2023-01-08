#!/usr/bin/env bash

kubectl delete cm nginx-config 
kubectl delete deploy nginx 
kubectl delete svc nginx 

helm uninstall loki-stack -n monitoring
