## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch6.[Stable] 구체적인 목적을 가지고 사용되는 패널 (optional)

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : 1 - sum(rate(node_cpu_seconds_total{mode="idle", node!="m-k8s"}[1m])) by (node)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Pie chart
* 패널 제목: 워커 노드 별 1분간 CPU의 사용 변화율
* 파이 차트(Pie chart)
  - Labels: Percent

**[상단 메뉴 / 대시보드 보기 설정]**
* 확인 범위: Last 5 minutes 

