# 패널 그리는 방법

**[우측 메뉴 / 패널 옵션]**
* 시각화: Bar chart
* 패널 제목: 네임스페이스 별 컨피그맵 갯수

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : count(kube_configmap_info) by (namespace) 
* 쿼리 옵션:
  * Legend: Format
  * Type: Auto
  * Time series: Table
  * Range: Instant
