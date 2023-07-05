## 패널 그리는 방법

**[대시보드 설정]**
* 이름: A.11.012

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: kube_node_info
* 쿼리 옵션:
  - Legend: Auto (no change)
  - Format: Table
  - Type: Instant

**[좌측 메뉴/ 트랜스폼(Transform)]** 
* Organize fields:
  - node
  - kernel_version
  - container_runtime_version
  - os_image
  - internal_ip
  - pod_cidr

**[우측 메뉴 / 패널 옵션]**
* 시각화: Table
* 패널 제목: 쿠버네티스 노드 정보

* Add field override 버튼 클릭
  - Fields with name 선택
    - node 선택
  - Add override property
    - Column alignment 선택
      - center 선택

* Add field override 버튼 클릭
  - Fields with name 선택
    - node 선택
  - Add override property
    - Column filter 선택
      - switch 켜기 

# 2
</br>

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 :  sum(rate(node_network_receive_bytes_total[5m])) by (node)
* 쿼리 옵션:
  - Legends: {{ node }}-수신

* 쿼리 : sum(rate(node_network_transmit_bytes_total[5m])) by (node)
* 쿼리 옵션:
  - Legends: {{ node }}-송신

**[우측 메뉴 / 패널 옵션]**
* 시각화: Time Series
* 패널 제목: 노드별 5분간 네트워크 트래픽 변화율
* 스탠다드 옵션(Standard options)
  - Unit - Data - bytes(IEC)
* Axis
  - Label: 송신 | 수신

* Add field override 버튼 클릭
  - Fields returned by query 선택
    - B 선택
  - Add override property
    - graph styles > Transform 선택
      - Negative Y 선택
 
**[상단 메뉴 / 대시보드 보기 설정]**
* 확인 범위: Last 5 minutes