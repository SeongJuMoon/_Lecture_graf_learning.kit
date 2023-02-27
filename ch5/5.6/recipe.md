## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch5.[Stable] 그라파나 패널에서 제공되는 다양한 옵션들

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: (node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes - node_memory_SReclaimable_bytes) / node_memory_MemTotal_bytes
* 쿼리 옵션:
    Legends: {{ node }}
`OR`
* 데이터 소스: 프로메테우스
* 쿼리: avg((node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes - node_memory_SReclaimable_bytes) / node_memory_MemTotal_bytes)  by (node)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Bar gauge
* 패널 제목: 노드 별 메모리 사용률
* 화면 표시 모드: Retro LCD
* 스탠다드 옵션(Standard options)
  - Unit - Misc - Percent (0.0-1.0)
* 텍스트 크기(Text size)
  - Max: 1 
* 임계치(Thresholds)
  - Thresholds mode를Percentage로 변경 
  - 빨간 동그라미 - 85%로 변경 
  - Add thresholds: 노란 동그라미 - 65%로 변경 

**[상단 메뉴 / 대시보드 보기 설정]**
* 확인 범위: Last 5 minutes 

