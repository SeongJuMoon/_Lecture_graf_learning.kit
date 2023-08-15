# 1
## 1-1 Introduce plugin panel
Clock => 세계 시간 특정 타임존의 시간을 나타내는 패널
FlowChatting => draw.io와 같은 사이트로부터 생성한 구성도를 나타내기 위해서 사용하는 패널
Guide Tour => 대시보드에 익숙하지 않은 사용자를 위해서 상호작용 튜토리얼을 구현하기 위한 목적으로 사용하는 패널
Polystat => 데이터독에서 제공하는 호스트 모니터링에서 호스트를 보여주는 것과 유사함 각 호스트(노드) 상태를 나타내기에 좋음
Treemap => 영역에서 어느 정도 규모를 가지는 지 보여주는 패널 데이터 주로 인텔리제이서 라이브러리가 참조하는 라이브러리 구조를 보여주는 용도로 사용함.

## 1-2 checkout recipe.md

## 1-3 remove panel plugin and 17900 dashboard

# 2
## 2-1 deploy standalone redis via redis.yaml
cat redis.yaml
k apply -f redis.yaml

## install redis application grafana application
# shortcut http://192.168.1.12/plugins/redis-app
# and enable application

## Enter console redis command.
client list
set hello world
get hello
# world
del hello
get hello


## remove application and redis.

