## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch5.[Stable] 그라파나 패널에서 제공되는 다양한 옵션들

**[우측 메뉴 / 패널 옵션]**
* 시각화: Gauge
* 패널 제목: 노드 별 1분 간 CPU의 평균 사용률  
* 스탠다드 옵션(Standard options)
  - Unit - Misc - Percent (0.0-1.0)
* 텍스트 크기(Text size)
  - Max: 1 
* 임계치(Thresholds)
  - Thresholds mode를Percentage로 변경 
  - 빨간 동그라미 - 90%로 변경 
  - Add thresholds: 노란 동그라미 - 60%로 변경 


**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리:  1 - (avg(rate(node_cpu_seconds_total{mode="idle"}[1m])) by (node))
