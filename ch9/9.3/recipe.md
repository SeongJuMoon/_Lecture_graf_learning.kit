## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch9.3.그라파나 변수를 활용해서 원하는 정보를 선택해서 보기

**[변수 설정] namespace**
* Dashboard Settings > Variables 로 이동합니다.
  - General
    - **Name**: namespace
    - **Label**: namespace
    - **Type**: Query
  - **Query Options**
    - Query: label_values(kube_namespace_created, namespace)
  - **Selection options**
    - **Include All option**: true
    - **Custom all value**: .+?

#1
**[좌측 메뉴/ 쿼리 편집기]** 
데이터 소스: 프로메테우스
쿼리: count(kube_replicaset_status_ready_replicas{namespace=~"$namespace"}) by (namespace)
**[우측 메뉴 / 패널 옵션]**
시각화: Stat
패널 제목: $namespace of total replicaset 
* Standard Options
  - No value: 0

# 아코디언 메뉴 만들기 - 1 
- Title: $namespace namespace summary 

#2 
**[좌측 메뉴/ 쿼리 편집기]** 
데이터 소스: 프로메테우스
쿼리: count(kube_deployment_status_condition{namespace=~"$namespace", status="true"}) by (namespace)

**[우측 메뉴 / 패널 옵션]**
시각화: Time Series
패널 제목: $namespace active deployment count

#2-variable

**[변수 설정] Pod**
* Dashboard Settings > Variables 로 이동합니다.
  - General
    - **Name**: pod
    - **Label**: pod
    - **Type**: Query
  - **Query Options**
    - Query: label_values(kube_pod_info{namespace=~"$namespace"}, pod)
  - **Selection options**
    - **Include All option**: true
    - **Custom all value**: .+?

# 아코디언 메뉴 만들기 - 2
- Title: $pod pod summary

#3
**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : kube_pod_container_info{namespace=~"$namespace", pod=~"$pod"}
* 쿼리 옵션:
  - Legend: Auto (no change)
  - Format: Table
  - Type: Instant

**[우측 메뉴 / 패널 옵션]**
* 시각화: Table
* 패널 제목: $namespace namespace $pod pod summaries

**[좌측 메뉴/ 트랜스폼(Transform)]** 
* Organize fields:
  - namespace
  - pod
  - container
  - image
  - node

#4
**[우측 메뉴 / 패널 옵션]**
* 시각화: Time series
* 패널 제목: $pod container used cpu (rated , 5m)
**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : rate(container_cpu_usage_seconds_total{namespace=~"$namespace", pod=~"$pod", container!=""}[5m])
* 쿼리 옵션
  - Legends: {{pod}}/{{container}}

#5
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리 : sum(container_memory_working_set_bytes{namespace=~"$namespace", pod=~"$pod", container!=""}) by (container)
**[우측 메뉴 / 패널 옵션]**
* 시각화: Gauge
* 패널 제목: per $namespace $pod containers memory usage bytes
* Standard Options
  - Unit
    - data -> bytes(si)
* Thresholds
  - base만 남기고 다 지움

**[변수 설정] Container**
* Dashboard Settings > Variables 로 이동합니다.
  - General
    - **Name**: container
    - **Label**: container
    - **Type**: Query
  - **Query Options**
    - Query: label_values(kube_pod_container_info{namespace=~"$namespace", pod=~"$pod"}, container)
  - **Selection options**
    - **Include All option**: true
    - **Custom all value**: .+?

#6 #4에서 쿼리 편집
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: rate(container_cpu_usage_seconds_total{namespace=~"$namespace", pod=~"$pod", container=~"$container"}[5m])

#7 #5 변경
* 데이터 소스: 프로메테우스
* 쿼리:  sum(container_memory_working_set_bytes{namespace=~"$namespace", pod=~"$pod", container=~"$container"}) by (container)

