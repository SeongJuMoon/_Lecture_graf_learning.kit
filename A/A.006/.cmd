
# 1. Check grafana is grafana or proemtheus-stack-grafana
k get po -n monitoring | grep grafana

# 2. exec bash to pod.

# grafana 
./1.connect-grafana-pod.sh grafana
# prometheus-stack
./1.connect-grafana-pod.sh prometheus-stack

# 3. found grafana data directory from environment variable.
# $GF_PATHS_DATA set `/var/lib/grafana/` 
printenv | grep GF_
cd $GF_PATHS_DATA

# 1-3. Check DATA_DIR into db.
# sqllite3, ext: .sqllite, .db
ls 
# we found grafana.db at /var/lib/data.
# Enter sqlite command to connect sqllite database.
sqllite3 grafana.db

# 1-4. Check os distro os-release.
cat /etc/os-release 
# Check privileges to id and linux distro.
id

# 1-5. Try to apk install sqllite3
apk add sqlite

# 1.6. Escape current executed bash shell.
# Ctrl + D

# 2-1. Check grafana pod via kubectl to known grafana pod name.
k get po -n monitoring

# 2-2. Check connection guide to root escaliated for grafana container.
# grafana
./2.print-connection-guide.sh grafana <Enter the found grafana pod name at step 2-2>
# prometheus-stack
./2.print-connection-guide.sh prometheus-stack <Enter the found grafana pod name at step 2-2>

# 3-1 Open your deployed kubernetes node.
# Navigate to the Kubernetes node you identified above by opening the Superputty new Sessions tab
# Next, use the runc command to navigate inside the container

# 3-2 Check current session is container internals.
# pwd 
# printenv | grep GF_
# cd  

# 3-3 Check privileges current user.
id
whoami

# retry install sqlite3.
apk add sqlite 


3-4 enter grafana internal db via sqlite3 command.
# sqlite3 grafana.db
# command check
# .help
# change view result mode  
# .mode line
# check all tables.
# .table

# check all table in grafana.
# check user
# check dashboard;
# check configuration (data-source)

select * from user;
select * from dashboard;
select * from data_source;

# 3-5 change password from 
cat 3.admin-password-reset.sql
update user set password = '59acf18b94d7eb0694c61e60ce44c110c7a683ac6a8f09580d626f90f4a242000746579358d77dd9e570e83fa24faa88a8a6', salt = 'F3FAxVm33R' where login = 'admin';
