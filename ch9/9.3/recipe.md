## 대시보드 설정 방법 
**General** 
* 이름: ch9.3.그라파나 변수를 활용해서 원하는 정보만 선택해서 보기

**Variables**
  - Add variables 
    - **Namespace**
      - Name: namespace
      - Label: namespace
      - Type: Query
    - **Query Options**
      - Query: label_values(kube_namespace_created, namespace)
    - **Selection options**
      - Include All option: enabled 
      - Custom all value(after above option): .+? 

  - New variable 
    - **Namespace**
      - Name: pod
      - Label: pod
      - Type: Query
    - **Query Options**
      - Query: label_values(kube_pod_info{namespace=\~"$namespace"}, pod)
    - **Selection options**
      - Include All option: enabled 
      - Custom all value(after above option): .+? 

  - New variable 
    - **Namespace**
      - Name: container
      - Label: container
      - Type: Query
    - **Query Options**
      - Query: label_values(kube_pod_container_info{namespace=\~"$namespace", pod=\~"$pod"}, container)
    - **Selection options**
      - Include All option: enabled 
      - Custom all value(after above option): .+? 

## 패널 그리는 방법 

#1-1 아코디언 메뉴 만들기
* Title: $namespace namespace summary 

#1-2-1 </br>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: count(kube_replicaset_status_ready_replicas{namespace=\~"$namespace"}) by (namespace)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Stat
* 패널 제목: $namespace of total replicaset 
  - Standard Options
    - No value: 0

#1-2-2 </br>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: count(kube_deployment_status_condition{namespace=\~"$namespace", status="true"}) by (namespace)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Time Series
* 패널 제목: $namespace active deployment count


#2-1 아코디언 메뉴 만들기
* Title: $pod pod summary

#2-2-1 </br>
**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : kube_pod_container_info{namespace=\~"$namespace", pod=\~"$pod"}
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

#2-2-2 </br>
**[우측 메뉴 / 패널 옵션]**
* 시각화: Time series
* 패널 제목: $pod container used cpu (rated , 5m)

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리: rate(container_cpu_usage_seconds_total{namespace=\~"$namespace", pod=\~"$pod", container=\~"$container"}[5m])
* 쿼리 옵션
  - Legends: {{pod}}/{{container}}

#2-2-3 </br>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리:  sum(container_memory_working_set_bytes{namespace=\~"$namespace", pod=\~"$pod", container=\~"$container"}) by (container)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Gauge
* 패널 제목: per $namespace $pod containers memory usage bytes
* Standard Options
  - Unit
    - data -> bytes(si)
* Thresholds
  - base만 남기고 다 지움

