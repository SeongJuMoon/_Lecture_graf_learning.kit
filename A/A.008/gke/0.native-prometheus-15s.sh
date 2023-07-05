#!/usr/bin/env bash
# scrape default is 1m 

# library code for shimless install.
export SIDECAR_IMAGE_NAME=${SIDECAR_IMAGE_NAME:-'gcr.io/stackdriver-prometheus/stackdriver-prometheus-sidecar'}
export SIDECAR_IMAGE_TAG='0.10.1'
function util::user::readline() {
  local input=''
  while [[ $input == '' ]]; do
    read -p "$*" input
  done
  echo "$input"
}
export GCP_PROJECT=$(util::user::readline "GCP PROJECT ID를 입력해주세요.: ")
export GCP_REGION=$(util::user::readline "GCP REGION을 입력해주세요.: ")
export KUBE_CLUSTER=$(util::user::readline "GKE CLUSTER 이름을 입력해주세요.: ")
export DATA_VOLUME="storage-volume"
export DATA_DIR="/data"
export KUBE_NAMESPACE="monitoring"

echo "add edu repo for gke"
helm repo add edu https://k8s-edu.github.io/helm-charts/graf
helm repo update

echo "install prometheus environment for gke."

helm install prometheus edu/prometheus \
--set pushgateway.enabled=false \
--set alertmanager.enabled=false \
--set nodeExporter.tolerations[0].key="node-role.kubernetes.io/master" \
--set nodeExporter.tolerations[0].effect="NoSchedule" \
--set nodeExporter.tolerations[0].operator="Exists" \
--set nodeExporter.tolerations[1].key="node-role.kubernetes.io/control-plane" \
--set nodeExporter.tolerations[1].effect="NoSchedule" \
--set nodeExporter.tolerations[1].operator="Exists" \
--set server.global.scrape_interval="15s" \
--set server.global.evaluation_interval="15s" \
--set server.extraFlags[0]="web.enable-lifecycle" \
--set server.extraFlags[1]="storage.tsdb.no-lockfile" \
--set server.sidecarContainers.monitoring.image="${SIDECAR_IMAGE_NAME}:${SIDECAR_IMAGE_TAG}" \
--set server.sidecarContainers.monitoring.imagePullPolicy=Always \
--set server.sidecarContainers.monitoring.args[0]="--stackdriver.project-id=${GCP_PROJECT}" \
--set server.sidecarContainers.monitoring.args[1]="--prometheus.wal-directory=${DATA_DIR}/wal" \
--set server.sidecarContainers.monitoring.args[2]="--stackdriver.kubernetes.location=${GCP_REGION}" \
--set server.sidecarContainers.monitoring.args[3]="--stackdriver.kubernetes.cluster-name=${KUBE_CLUSTER}" \
--set server.sidecarContainers.monitoring.ports[0].name=monitoring \
--set server.sidecarContainers.monitoring.ports[0].containerPort="9091" \
--set server.sidecarContainers.monitoring.volumeMounts[0].name=${DATA_VOLUME} \
--set server.sidecarContainers.monitoring.volumeMounts[0].mountPath=${DATA_DIR} \
--create-namespace \
-n ${KUBE_NAMESPACE}
