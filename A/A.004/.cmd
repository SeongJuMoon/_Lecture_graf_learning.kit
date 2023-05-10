1. Connect grafana server admin menu via your web browser.
# notice you must login admin user.
# the menu required grafana admin privileges.
# <shoutcut> http://192.168.1.12/admin/users

2-1. Press right upside New User button. to create new user.
# Name: Alice
# UserName: Alice
# Password: Alice
# Click Create User to create Alice.
# Check privileges:	Viewer

2-2. Press right upside New User button. to create new user.
# Name: Bob
# UserName: Bob
# Password: BobBob
# Caused by: The password required least 4 word.
# Click Create User to Bob Alice.
# Check privileges:	Viewer

2-3. Open browser congnito mode, Conect grafana ui.
# <shoutcut> http://192.168.1.12/
# Login to Alice, check successfully logined grafana.
# Bob to Alice, check successfully logined grafana.

2-4. Check Server admin page.
# Check Last active chanaged.


3-1. Click Configruation/Team menu to Create Team.
# <shoutcut> http://192.168.1.12/org/teams
# Click New team.
# Name: 운영관리팀
# Click Create.

3-2. Add Bob and Alice into 운영관리팀.
# Click Add member.
# Choose User and Alice and select member at generated ui after click save button. 
# Choose User and Bob and select member at generated ui after click save button.
# Click x button to disposing generated ui.
# Check All member added into 운영관리팀.


4-1  import .ch5.그라파나 패널에서 제공되는 다양한 옵션들-1675759736688.json  import to permission.
# Click Dashboard > Import > Upload JSON file.
# PATH: C:\HashiCorp\_Lecture_graf_learning.kit\ch5
# FILE: .ch5.그라파나 패널에서 제공되는 다양한 옵션들-1675759736688.json
# Check Prometheus.
# Click Import.

4-2 Check Permission `ch5.그라파나 패널에서 제공되는 다양한 옵션들`.
# Login to Alice. Check The dashboard is not editable.

4-3. Grant `ch5.그라파나 패널에서 제공되는 다양한 옵션들` dashboard at 운영관리팀.
# Choose target dashboard we recomm to `ch5.그라파나 패널에서 제공되는 다양한 옵션들`
# Click Dashboard Settings > Permission
# Click Add a permission.
# Choose Team, 운영관리팀, Edit at generated ui and Save button click.
# Click x button to disposing generated ui.
# Check dashboard permission into `ch5.그라파나 패널에서 제공되는 다양한 옵션들`.

4-4 Check Permission `ch5.그라파나 패널에서 제공되는 다양한 옵션들`.
# Login to Alice. Check The dashboard is editable.

4-5. remove Alice at 운영관리팀.
# <shoutcut> http://192.168.1.12/org/teams
# Click X Button, Row at Alice

4-6 Check Permission `ch5.그라파나 패널에서 제공되는 다양한 옵션들`.
# Login to Alice. Check The dashboard is not editable.
