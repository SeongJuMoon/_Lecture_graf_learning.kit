#1. install mysql-client for provision test dataset.
./0.mysql-client-installer.sh
#2. deploy mysql deployment and service
kubectl apply -f ./mysql.yaml
#3. connect to mysql instance to test connection is reachable.
mysql -h 192.168.1.97 -u root -p
# enter the password: root
#4. provision dataset from initialize script.
1.initialize-testdata.sh
