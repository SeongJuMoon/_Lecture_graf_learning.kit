1. open new chrome tab and enter github repository.
# shortcut https://github.com/seongjumoon/_Lecture_graf_learning.kit/

2. move A/A.009/gke/gke-environment-setup.sh and copy link from raw button.

3. Open Google cloud console project.
# shortcut https://console.cloud.google.com

4. Click right side editor button. to open cloudshell.

5. Download setup script to cloudshell.
curl -LO  https://github.com/SeongJuMoon/_Lecture_graf_learning.kit/raw/main/A/A.009/gke/gke-environment-setup.sh

6. add execute permission on gke-environment-setup.sh 
chmod +x gke-environment-setup.sh

7. execute gke-environment-setup.sh
+ enable gke service.
+ create gke.
+ get gke access credentials.
+ deploy native prometheus and cloud monitoring sidecar/
+ add grafana service account to call cloud monitoring api.
+ expose grafana service account token.

8. Lookaround deploy asset gke and service account and cloud monitoring.
# shortcut https://console.cloud.google.com/kubernetes/list/
# shoutcut https://console.cloud.google.com/iam-admin/iam
# shortcut https://console.cloud.google.com/monitoring;duration=PT1H
