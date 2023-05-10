# check grafana deployment via kubectl edit.
k edit -n monitoring deployments/prometheus-stack-grafana
# check volumes, keyword: volumeMounts
# check environment keyword env
#  - name: GF_SECURITY_ADMIN_USER
#    valueFrom:
#       secretKeyRef:
#         key: admin-user
#         name: prometheus-stack-grafana
#  - name: GF_SECURITY_ADMIN_PASSWORD
#    valueFrom:
#       secretKeyRef:
#         key: admin-password
#         name: prometheus-stack-grafana


# check grafana initialize password.
k get -n monitoring secret prometheus-stack-grafana -o jsonpath="{.data.admin-password}" | base64 -d

# Enter grafana container.
# in prometheus stack
k exec -n monitoring -it deployments/prometheus-stack-grafana -c grafana -- bash
# in prometheus+grafana
k exec -n monitoring -it deployments/grafana -c grafana -- bash

# change admin password
grafana-cli admin reset-admin-password <your-password>