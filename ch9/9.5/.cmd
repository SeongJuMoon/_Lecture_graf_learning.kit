# 0. Create nginx deployment with 3 replicas. 
k create deploy nginx --image=nginx:stable --replicas=3

# 1. To simulate outage, scaled deploy nginx replicas down to 1.
k scale deploy nginx --replicas 1

# 2. Restore simulate outage, scaled deploy nginx replicas up to 5.
k scale deploy nginx --replicas 3

# 3. Delete nginx deployment.
k delete deploy nginx
