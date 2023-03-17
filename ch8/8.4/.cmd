# pre-requirement 

## deploy jaeger 
k apply -f 0.jaeger
## check 
k get po,svc -n monitoring

## deploy hotrod application 
k apply -f 1.example-hotrod-🚗
## check 
k get po,svc 

## uninstall all of applications 
./2.hotrod-n-jaeger-uninstaller.sh
