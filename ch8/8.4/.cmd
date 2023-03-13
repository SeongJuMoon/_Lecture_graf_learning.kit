# pre-requirement 
## deploy jaeger 
k apply -f 0.jaeger/manifests/
## deploy hotrod application 
k apply -f 0.jaeger/example/hotrod-🚗 

# after drawing Canvas panel 
k scale -n ingress-nginx deployment ingress-nginx-controller --replicas=0
k scale -n ingress-nginx deployment ingress-nginx-controller --replicas=1

# delete deployed app
k delete -f 0.ingress_ctrl_loadbalancer.yaml

