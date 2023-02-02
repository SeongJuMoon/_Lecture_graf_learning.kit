# 패널 그리는 방법


**[우측 메뉴 / 패널 옵션]**
* 시각화: Gauge
* 패널 제목: 5분 간 CPU 사용률 (1m)

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리:  1 - (avg by (node) 	(rate(node_cpu_seconds_total{mode="idle"}[1m])))
