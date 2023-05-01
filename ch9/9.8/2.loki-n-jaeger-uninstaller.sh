#!/usr/bin/env bash

echo "1. loki install via helm."

helm install loki-stack edu/loki-stack \
--set grafana.enabled=false \
--namespace monitoring 

echo "2. nginx install via kubectl."
kubectl apply -f nginx ~/_Lecture_graf_learning.kit/ch9/9.8/nginx

echo "3.jaeger and hotrod install via kubectl."
kubectl apply -f ~/_Lecture_graf_learning.kit/ch9/9.8/jaeger

echo "loki & jaeger datasource delete successfully."
