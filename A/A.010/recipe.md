## 패널 그리는 방법

**[대시보드 설정]**
* 이름: A.11.010

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: kube_node_info
* 쿼리 옵션:
  - Legend: Auto (no change)
  - Format: Table
  - Type: Instant

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

**[좌측 메뉴/ 트랜스폼(Transform)]** 
* Organize fields:
  - node
  - kernel_version
  - container_runtime_version
  - os_image
  - internal_ip
  - pod_cidr

