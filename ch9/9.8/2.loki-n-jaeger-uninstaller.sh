#!/usr/bin/env bash

echo "1. loki uninstall via helm."

helm uninstall loki-stack edu/loki-stack \
--namespace monitoring 

echo "2. nginx delete via kubectl."
kubectl delete -f nginx ~/_Lecture_graf_learning.kit/ch9/9.8/nginx

echo "3.jaeger and hotrod delete via kubectl."
kubectl delete -f ~/_Lecture_graf_learning.kit/ch9/9.8/jaeger
kubectl delete -f ~/_Lecture_graf_learning.kit/ch9/9.8/example-hotrod-🚗

echo "loki & jaeger datasource delete successfully."
