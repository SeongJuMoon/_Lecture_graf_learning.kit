## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch5.[Stable] 그라파나 패널에서 제공되는 다양한 옵션들

**[우측 메뉴 / 패널 옵션]**
* 시각화: Table
* 패널 제목: 쿠버네티스 노드 정보

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: kube_node_info
* 쿼리 옵션:
  - Legend: Auto (no change)
  - Format: Table
  - Type: Range (no change)

**[좌측 메뉴/ 트랜스폼(Transform)]** 
* Organize fields:
  - node
  - kernel_version
  - container_runtime_version
  - os_image
  - intrnal_ip
  - pod_cidr

