## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch5.[Stable] 그라파나 패널에서 제공되는 다양한 옵션들

**[우측 메뉴 / 패널 옵션]**
* 시각화: Bar chart
* 패널 제목: 네임스페이스 별 컨피그맵 갯수
* 방향 지시(orientation): Horizontal
* 범례(Legend): 끄기 

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : count(kube_configmap_info) by (namespace) 
* 쿼리 옵션:
  - Legend: Auto (no change)
  - Format: Table
  - Type: Instance 
