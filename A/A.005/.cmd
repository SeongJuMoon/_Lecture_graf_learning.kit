# Enter grafana container.
# in prometheus stack
k exec -n monitoring -it deployments/prometheus-stack-grafana -c grafana -- bash
# in prometheus+grafana
k exec -n monitoring -it deployments/grafana -c grafana -- bash

# change admin password
grafana-cli admin reset-admin-password $GF_SECURITY_ADMIN_PASSWORD
