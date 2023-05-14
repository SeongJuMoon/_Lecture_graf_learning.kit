
# 1. Check grafana is grafana or proemtheus-stack-grafana
k get po -n monitoring | grafana

# 2. exec bash to pod.

# grafana 
k exec -it deployments/grafana -n monitoring 
# prometheus-stack
k exec -it deployments/prometheus-stack-grafana -n monitoring

# Check DATA_DIR into db.
# sqllite3, ext: .sqllite, .db
# we found grafana.db at /var/lib/data.

# Check sqllite3 commandline.
sqllite3 

# Check privileges to id
id

# Try to apk install sqllite3
apk update && apk upgrade
apk add --no-cache sqlite

# get unique containerID.
k get po deployments/grafana  -n monitoring -o jsonpath="{.status.containerStatuses[].containerID
}" | sed 's/.*\/\///'

k get po deployments/prometheus-stack-grafana -n monitoring -o jsonpath="{.status.containerStatuses[].containerID
}" | sed 's/.*\/\///'


#3. attach to grafana pod in grafana container escalate root user.
runc --root /run/containerd/runc/k8s.io/ exec -t -u 0 <token> sh

3.
4.
5.
6.
7.
8.
