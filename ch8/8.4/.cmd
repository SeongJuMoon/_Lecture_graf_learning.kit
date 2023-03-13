# pre-requirement 

## deploy jaeger 
k apply -f 0.jaeger/manifests/
## check 
k get po,svc -n monitoring

## deploy hotrod application 
k apply -f 0.jaeger/example/hotrod-🚗 
## check 
k get po,svc 

