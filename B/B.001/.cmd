# 0. Settings and verify opsgenie.
shoutcut: https://www.atlassian.com/software/opsgenie
- sign up
- profile settings: enter your phone number and verify
- Install Opsgenie app on your phone. <iOS, Android>

# 0-1. Create teams for active opsgenie on-call.
shortcut: https://<youropsgenie>.app.opsgenie.com/teams/list
0-2. Click [Add team] button.
0-3. Fill in the form below.
  * Name: SRE
  * Description: SRE Team
0-4. Click [Add team] button.

# 0-2. Create API Integration for prometheus alertmanager.
0-2-1. Click SRE team at team list. 
0-2-2. Click [ Integrations ] tab on left side.
0-2-3. Click [ Add Integration ] button.
0-2.4. Search [ Grafana ] and click.
0-2-5. Fill in the form below.
  * Name: grafana
  * Assignee team: SRE
0-2-6. Click [ Coutinue ] button.
0-2-7. Click [Steps to configure the integration] accordion menu.
0-2-8. Check your API key at 3rd steps and copy it.
0-2-9. Click [ Turn on integration ] button.

# 1. deploy nginx-w-exporter for send alert to opsgenie.
k apply -f ./1-1.nginx-w-exporter
# 1-1. Confirm deploy and service deployed as well.
k get po,svc

# 2. Configuration alertmanager on grafana.
# 2-1. Access to grafana.
shoutcut: http://192.168.1.12/login
# 2-2. In Grafana, from top left Grafana icon select Notifications under Alerting tab.
# In Alert notifications, Click New contact point.
# Fill Name field and select Opsgenie for Type
    Name: Opsgenie
    API Key: Paste <your-token> into API Key  from 5th steps.
    Alert API URL: Paste  https://api.opsgenie.com/v2/alerts into Alert API Url from 4th steps.
# 2-3. Click [ Test ] button.
# 2-4. Click [ Send test notification ] button.
# 2-5. Click [ Save contact point ] button.

# 3. Trigger on-call to opsgenie via kubectl scale command.
kubectl scale deployment nginx -n monitoring --replicas=0
# 3-1. Confirm alert on opsgenie.
shoutcut: https://<youropsgenie>.app.opsgenie.com/alert/list
Or
Opsgenie app on your phone.
# 3-2. Resolve triggered alert via kubectl scale command.
kubectl scale deployment nginx -n monitoring --replicas=2
