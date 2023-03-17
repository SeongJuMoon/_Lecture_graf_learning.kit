# deploy ingress_ctrl for testing purpose
k apply -f ingress_ctrl_loadbalancer.yaml

# after drawing Canvas panel 
k scale -n ingress-nginx deployment ingress-nginx-controller --replicas=0
k scale -n ingress-nginx deployment ingress-nginx-controller --replicas=1

# delete deployed app
k delete -f ingress_ctrl_loadbalancer.yaml

