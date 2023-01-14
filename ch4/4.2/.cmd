# create configmap for change dashboard pannel data change
k create configmap db-hostinfo --from-file host-info.conf
configmap/db-hostinfo created

# check configmap resource 
k get cm db-connection-info -o yaml
apiVersion: v1
data:
  host-info.conf: |
    DB_HOST=database.default.svc.cluster.local
    DB_PORT=3306
    DB_DATABASE_NAME=service
kind: ConfigMap
metadata:
  ...
  name: db-hostinfo
  namespace: default
  ...

# delete configmap for change dashboard pannel data change
k delete configmap db-hostinfo
configmap "db-hostinfo" deleted