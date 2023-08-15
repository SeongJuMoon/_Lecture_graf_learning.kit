#!/usr/bin/env bash

export SIDECAR_IMAGE_NAME=${SIDECAR_IMAGE_NAME:-'gcr.io/stackdriver-prometheus/stackdriver-prometheus-sidecar'}
export SIDECAR_IMAGE_TAG='0.10.1'
function util::user::readline() {
  local input=''
  while [[ $input == '' ]]; do
    read -p "$*" input
  done
  echo "$input"
}

export GCP_PROJECT=$(util::user::readline "GCP PROJECT ID를 입력해주세요: ")
export GCP_REGION=$(util::user::readline "GCP REGION을 입력해주세요: ")
export KUBE_CLUSTER=$(util::user::readline "GKE CLUSTER 이름을 입력해주세요: ")
export CLUSTER_VERSION=$(util::user::readline "ℹ️  현재 사용가능한 클러스터 버전은 https://cloud.google.com/kubernetes-engine/docs/release-notes-nochannel 를 참고하세요
GKE CLUSTER 버전을 입력해주세요: ")
export DATA_VOLUME="storage-volume"
export DATA_DIR="/data"
export KUBE_NAMESPACE="monitoring"
export ACCOUNT_NAME="grafana"

echo "Setup permission GKE for labs."
gcloud services enable container.googleapis.com containerregistry.googleapis.com
echo "Create GKE cluster for lab."

# gcloud kubernetes
gcloud container clusters create $KUBE_CLUSTER \
--num-nodes=3 \
--zone=${GCP_REGION}-a \
--no-enable-autorepair \
--no-enable-autoupgrade \
--cluster-version="${CLUSTER_VERSION}" \
--release-channel=None

echo "[GKE] kubernetes auth."
gcloud container clusters get-credentials $KUBE_CLUSTER --zone ${GCP_REGION}-a

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

# gcloud iam auth 
echo "[Create ServiceAccount] "
export GCE_SERVICE_ACCOUNT_MAIL=$(gcloud iam service-accounts list --filter "Name:Compute Engine default service account" --format json | jq -rc .[].email)
gcloud projects add-iam-policy-binding ${GCP_PROJECT} --member "serviceAccount:${GCE_SERVICE_ACCOUNT_MAIL}" --role='roles/monitoring.admin'

gcloud iam service-accounts create $ACCOUNT_NAME --display-name $ACCOUNT_NAME
export GRAFANA_SERVICE_ACCOUNT_MAIL=$(gcloud iam service-accounts list --filter "displayName: $ACCOUNT_NAME" --format json | jq -rc .[].email)
gcloud iam service-accounts keys create /tmp/grafana-key.json --iam-account $GRAFANA_SERVICE_ACCOUNT_MAIL
gcloud projects add-iam-policy-binding $GCP_PROJECT --member "serviceAccount:$GRAFANA_SERVICE_ACCOUNT_MAIL" --role "roles/monitoring.admin"

echo "please copy below credential json."
cat /tmp/grafana-key.json