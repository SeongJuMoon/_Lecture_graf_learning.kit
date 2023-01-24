# 1. install tempo
./1.tempo-installer.sh
# 2. deploy sample load generator
k apply -f 2.dpy-load-gen.yaml
# 3. provisioning grafana data source
Configuration > Data Source > Add data source
Distributed tracing > Tempo > click
URL - http://tempo.monitoring.svc.cluster.local:3100
Service Graph > Prometheus
Enable Node Graph > Enabled

# 4. get traceid from load generator
k logs deploy/synthetic-load-generator
# 5. trace applcation on grafana explore via traceid

# 6. draw panel with tempo 
