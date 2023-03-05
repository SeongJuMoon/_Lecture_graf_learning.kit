0. install dependecies loki
./loki-installer.sh

1.check loki deployment is ready 
k get po -l app=loki -n monitoring
---
[root@m-k8s 1.3]# k get po -l app=loki -n monitoring
NAME           READY   STATUS    RESTARTS   AGE
loki-stack-0   1/1     Running   0          1m

2.check loki service endpoint
k get svc -l app=loki -n monitoring
----
[root@m-k8s 1.3]# k get svc -n monitoring -l app=loki
NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
loki-stack              ClusterIP   10.104.112.228   <none>        3100/TCP   9m46s
loki-stack-headless     ClusterIP   None             <none>        3100/TCP   9m46s
loki-stack-memberlist   ClusterIP   None             <none>        7946/TCP   9m46s

3.setting datasource in grafana

4.draw `log` pannel in the dashboard
 - Data source: loki 
 - log code: {app="nginx"} |= "error"

5.uninstall loki and nginx 
k delete -f 2.nginx-n-loki-uninstaller.sh
